package main

import (
	"fmt"
	"io/ioutil"
	"path"
	"regexp"
	"strings"
)

// FileInfo – Information about file
type FileInfo struct {
	name  string
	data  string
	score int
}

var wrongGuesses = regexp.MustCompile(`\|(.*?)\|`)

func calcFileScore(data string) int {
	totalNumOfWords := len(strings.Split(data, " "))
	fmt.Println(wrongGuesses.FindAllString(data, -1))
	return totalNumOfWords
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
	fmt.Println(files)
}
