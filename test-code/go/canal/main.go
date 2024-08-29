package main

import (
	"dev_canal/cluster"
	"fmt"
)

func main() {
	fmt.Println("start....")

	cluster.Connect()
	// simple.Connect()
}
