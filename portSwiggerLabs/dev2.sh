#!/bin/bash

store_credit=$(curl -s 'https://0ab900f504311b7c81be25e0003700e3.web-security-academy.net/cart' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'cache-control: max-age=0' \
  -H 'cookie: session=bdJE7IuAbgFws6q5GxhJ6jyjU6p3YhZ8' \
  -H 'priority: u=0, i' \
  -H 'referer: https://0ab900f504311b7c81be25e0003700e3.web-security-academy.net/my-account?id=wiener' \
  -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -oP '\d+\.\d{2}' | cut -d "." -f 1 | cut -d ")

echo $store_credit




K0IXLO6eRU
VMZkFSdHnP
ej2gP7JGgx