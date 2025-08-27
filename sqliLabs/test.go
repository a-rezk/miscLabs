package main

import (
	"fmt"
	"math/rand"
)

func maasdin() {
	randStr := fmt.Sprintf("%x", rand.Uint32())
	fmt.Println(randStr)
}
