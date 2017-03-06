package main

import (
	"fmt"
)

func pointers() {
	fmt.Println()
	fmt.Println("Pointers: ")

	i, j := 42, 2701

	p := &i
	fmt.Println(*p)
	*p = 21
	fmt.Println(i)

	p = &j
	*p = *p / 37
	fmt.Println(j)
}

type Vertex struct {
	X int
	Y int
}

func structs() {
	fmt.Println()
	fmt.Println("Struct: ")

	v := Vertex{1, 2}
	v.X = 4

	fmt.Println(v)
}

func printSlice(s []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
}

func arrays() {
	fmt.Println()
	fmt.Println("Arrays: ")

	var a [2]string
	a[0] = "hello"
	a[1] = "world"
	fmt.Println(a[0], a[1])
	fmt.Println(a)

	primes := [6]int{2, 3, 5, 7, 11, 13}
	fmt.Println(primes)

	var s []int = primes[1:4]
	printSlice(s)

	r := []bool{true, false, true, true, false, true}
	fmt.Println(r)

	z := make([]int, 5)
	printSlice(z)

	s = append(s, 17, 19, 23)
	printSlice(s)
}

func ranges() {
	fmt.Println()
	fmt.Println("Ranges: ")

	var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

	for i, v := range pow {
		fmt.Printf("2**%d = %d\n", i, v)
	}
}

func maps() {
	fmt.Println()
	fmt.Println("Maps: ")

	m := map[string]Vertex{
		"Bell Labs": {40, -74},
		"Google":    {37, -122},
	}
	fmt.Println(m)

	v, ok := m["Google"]
	fmt.Println("The value:", v, "Present?", ok)

	a, oka := m["asdasd"]
	fmt.Println("The value:", a, "Present?", oka)
}

func main() {
	pointers()
	structs()
	arrays()
	ranges()
	maps()
}
