package main

import (
	"data-sync/converts"
	"time"
)

func main() {

	go converts.CustomConvert()
	time.Sleep(time.Second * 2)
	select {}
}
