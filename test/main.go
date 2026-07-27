package main

import (
	"fmt"
)

type x struct {
	Meow string
}

func (xx *x) String() string {
	return "mewo as string"
}

func main() {
	fmt.Println(new(x))
}
