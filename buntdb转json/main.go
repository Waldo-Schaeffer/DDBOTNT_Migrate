package main

import (
	"encoding/json"
	"log"
	"os"

	"github.com/tidwall/buntdb"
)

func main() {
	// 打开数据库文件
	db, err := buntdb.Open(".lsp.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// 创建一个用于存放数据的映射
	data := make(map[string]string)

	// 遍历数据库中的所有键值对
	err = db.View(func(tx *buntdb.Tx) error {
		return tx.Ascend("", func(key, value string) bool {
			data[key] = value
			return true // 继续遍历
		})
	})
	if err != nil {
		log.Fatal(err)
	}

	// 将映射转换为 JSON
	jsonData, err := json.MarshalIndent(data, "", "    ")
	if err != nil {
		log.Fatal(err)
	}

	// 将 JSON 数据写入文件
	err = os.WriteFile("output.json", jsonData, 0644)
	if err != nil {
		log.Fatal(err)
	}
}
