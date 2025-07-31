package main

import (
	"bufio"
	"crypto/md5"
	"encoding/base64"
	"encoding/hex"
	"fmt"
	"log"
	"os"
)

func generateMd5(s string) string {

	h := md5.New()
	h.Write([]byte(s))
	hSum := h.Sum(nil)
	hexHash := hex.EncodeToString(hSum)
	return hexHash
}

func main() {

	file, err := os.Open("pass.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var passwords []string

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		pass := scanner.Text()

		passwords = append(passwords, pass)
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	var results []string

	for _, pass := range passwords {
		fmt.Println(pass)
		val := "carlos:" + generateMd5(pass)
		results = append(results, base64.StdEncoding.EncodeToString([]byte(val)))
	}

	for _, cookie := range results {
		fmt.Println(cookie)
	}

}
