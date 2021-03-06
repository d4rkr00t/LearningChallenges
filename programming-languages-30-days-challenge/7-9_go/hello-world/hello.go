package main

import (
	"fmt"
	"math"
	"math/cmplx"
	"runtime"
)

func add(x, y int) int {
	return x + y
}

func swap(x, y string) (string, string) {
	return y, x
}

func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}

const Pi = 3.14

func sqrt(x float64) string {
	if x < 0 {
		return sqrt(-x) + "i"
	}
	return fmt.Sprint(math.Sqrt(x))
}

func pow(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	}
	return lim
}

func _Sqrt(x float64) float64 {
	z := 1.0
	z0 := z * 2
	for i := 0; math.Abs(z-z0) > 0.1; i++ {
		fmt.Println("start", z, z0, math.Abs(z-z0))
		z0 = z
		z = z - ((z*z - x) / (2 * z))
	}
	return z
}

func printOS() {
	fmt.Println("")
	fmt.Println("Go runs on: ")

	switch os := runtime.GOOS; os {
	case "darwin":
		fmt.Println("OS X")
	case "linux":
		fmt.Println("Linux")
	default:
		fmt.Printf("%s.", os)
	}
}

func main() {
	defer fmt.Println("============================================")
	defer fmt.Println("")

	var i, j int = 1, 2
	k := 10
	fmt.Println(add(8, 29))
	fmt.Println(swap("hello", "world"))
	fmt.Println(split(17))
	fmt.Println(i, j, k)

	var (
		ToBe   bool       = false
		MaxInt uint64     = 1<<64 - 1
		z      complex128 = cmplx.Sqrt(-5 + 12i)
	)
	fmt.Printf("Type: %T Value: %v\n", ToBe, ToBe)
	fmt.Printf("Type: %T Value: %v\n", MaxInt, MaxInt)
	fmt.Printf("Type: %T Value: %v\n", z, z)

	var l int = 42
	var f float64 = float64(l)
	var u uint = uint(f)
	fmt.Println(l, f, u)

	sum := 0
	for i := 0; i < 10; i++ {
		sum += i
	}
	fmt.Println(sum)

	sum2 := 1
	for sum2 < 1000 {
		sum2 += sum2
	}
	fmt.Println(sum2)

	fmt.Println(sqrt(2), sqrt(-4))

	fmt.Println(
		pow(3, 2, 10),
		pow(3, 3, 20),
	)

	fmt.Println()
	fmt.Println(_Sqrt(612.0))
	fmt.Println(math.Sqrt(612.0))

	printOS()
}
