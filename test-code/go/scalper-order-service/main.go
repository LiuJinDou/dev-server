package main

import (
	"encoding/json"
	"fmt"
	"scalper-order-service/service/request"
)

// 定义结构体来匹配 JSON 数据结构
type Address struct {
	Province string `json:"province"`
	City     string `json:"city"`
	District string `json:"district"`
	Place    string `json:"place"`
}

type Response struct {
	Data    [][]string `json:"data"`
	Status  int        `json:"status"`
	Message string     `json:"message"`
}

func main() {

	fmt.Println("Start....")

	client := request.NewAPIClient("http://127.0.0.1:8100")
	address := []string{"###&&$%$1231徐汇区123虹漕路461号58号楼5楼", "泉州市洛江区万安塘西工业区", "辽宁朝阳区", "21号大街"}
	result, err := client.Post("/batch/parse_address", address)
	fmt.Println(string(result))
	var ad Response
	ok := json.Unmarshal(result, &ad)
	if ok == nil {
		// var data []Address
		// json.Unmarshal([]byte(ad), &data)
		// fmt.Println(data)
		// for _, v := range data {
		// 	fmt.Println(v.Province)
		// }
		fmt.Println(ad)
	}
	fmt.Println(err)
	for _, v := range ad.Data {
		fmt.Println(v[0])
	}
}
