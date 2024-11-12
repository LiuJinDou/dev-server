package converts

import (
	"fmt"

	"github.com/robfig/cron/v3"
)

func Convert() {

	fmt.Println(11)
}

func CustomConvert() {
	c := cron.New()
	c.AddFunc("* * * * *", Convert)
	c.Start()
	select {}
}
