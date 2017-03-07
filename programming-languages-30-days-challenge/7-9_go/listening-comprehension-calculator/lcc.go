package main

import (
	"fmt"
	"io/ioutil"
	"path"
	"regexp"
	"sort"
	"strings"

	"math"

	"github.com/fatih/color"
)

// FileInfo – Information about file
type FileInfo struct {
	name  string
	data  string
	score float32
}

var wrongGuesses = regexp.MustCompile(`\|(.*?)\|`)

func calcFileWrongGuesses(wrong []string) int {
	result := 0

	for _, w := range wrong {
		result += len(strings.Split(w, " "))
	}

	return result
}

func calcFileScore(data string) float32 {
	totalNumOfWords := len(strings.Split(data, " "))
	totalWrongGuesses := calcFileWrongGuesses(wrongGuesses.FindAllString(data, -1))
	return 100.0 - (float32(totalWrongGuesses) / float32(totalNumOfWords) * 100.0)
}

func avgScore(files []FileInfo) float32 {
	var result float32

	for _, file := range files {
		result += file.score
	}

	return result / float32(len(files))
}

type ByScore []FileInfo

func (a ByScore) Len() int           { return len(a) }
func (a ByScore) Swap(i, j int)      { a[i], a[j] = a[j], a[i] }
func (a ByScore) Less(i, j int) bool { return a[i].score < a[j].score }

func buildMetrics(files []FileInfo, percentile float64) (float32, float32, float32, float32, string, string) {
	sort.Sort(ByScore(files))
	avg := avgScore(files)
	min := files[0].score
	max := files[len(files)-1].score
	percentilePos := int(math.Floor(float64(len(files))/100.0*percentile)) - 1

	return avg, min, max, files[percentilePos].score, files[0].name, files[len(files)-1].name
}

func getFiles(dir string) []string {
	files, _ := ioutil.ReadDir(dir)
	result := make([]string, len(files))
	for idx, file := range files {
		result[idx] = file.Name()
	}
	return result
}

func getFilesInfo(dir string, files []string) []FileInfo {
	result := make([]FileInfo, len(files))

	for idx, fileName := range files {
		data, _ := ioutil.ReadFile(path.Join(dir, fileName))
		dataStr := strings.TrimSpace(string(data))
		result[idx] = FileInfo{fileName, dataStr, calcFileScore(dataStr)}
	}

	return result
}

func main() {
	dir := "./data"
	files := getFilesInfo(dir, getFiles(dir))
	avg, min, max, percentile, worstFile, bestFile := buildMetrics(files, 80.0)

	red := color.New(color.FgRed).SprintFunc()
	redBg := color.New(color.FgBlack).Add(color.BgRed).SprintFunc()
	yellow := color.New(color.FgYellow).SprintFunc()
	// yellowBg := color.New(color.FgBlack).Add(color.BgYellow).SprintFunc()
	green := color.New(color.FgGreen).SprintFunc()
	greenBg := color.New(color.FgBlack).Add(color.BgGreen).SprintFunc()

	fmt.Println()
	fmt.Printf("         Worst:  %s\n", red(worstFile))
	fmt.Printf("     Min score:  %s\n", redBg(min))
	fmt.Println()
	fmt.Printf("          Best:  %s\n", green(bestFile))
	fmt.Printf("     Max score:  %s\n", greenBg(max))
	fmt.Println()
	fmt.Printf("     Avg score:  %s\n", yellow(avg))
	fmt.Printf("%s percentile:  %s\n", yellow("80%"), yellow(percentile))
}
