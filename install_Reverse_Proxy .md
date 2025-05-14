# Cấu hình Reverse Proxy trên Nginx

Mô hình triển khai
```
Client (Internet)
        ↓
61.14.236.210 (Proxy server)
        ↓
Proxy forward HTTPS → 61.14.236.211:14043
        ↓
edge 61.14.236.211 DNAT 14043 vào server web có ip local
```
# Cài Nginx
```
sudo apt -y update && apt -y upgrade
sudo apt install nginx -y
```

# Cấu hình Nginx làm Reverse Proxy
```
vi /etc/nginx/sites-available/proxy
```


```
server {
    listen 443 ssl;
    server_name lab.tanlv.io.vn;

    ssl_certificate /etc/letsencrypt/live/tanlv.io.vn/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/tanlv.io.vn/privkey.pem;

    location / {
        proxy_pass https://61.14.236.211:14043;
        proxy_ssl_verify off;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```
với cấu hình này chỉ forward traffic https, nếu server ngoài https còn các giao thức khác thì cần bổ sung cấu hình

# Kích hoạt cấu hình
```
sudo ln -s /etc/nginx/sites-available/proxy /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```
# Generate cert từ Let's Encrypt 

```
sudo apt install certbot python3-certbot-nginx -y
certbot certonly -d *.tanlv.io.vn --manual --preferred-challenges dns
```

thêm bản ghi này vào PA VN

giá trị BUdh97b__T92SNzWqRQ8dr2F-APh5EfBev5_dneBCdU được tạo ra khi chạy lệnh certbot certonly -d *.tanlv.io.vn --manual --preferred-challenges dns cần lưu lại chuổi này

![image](https://github.com/user-attachments/assets/0ff8d1c8-600c-42ce-a7a8-5794d3d7ecb7)

sau khi thêm bản ghi này mới tiếp tục generate cert

sau khi có cert, copy cert đên đúng đường dẫn đã cấu hình trong file cấu hình /etc/nginx/sites-available/proxy.
Hoặc ngược lại sửa lại đường dẫn file cấu hình

# Cấu hình trên edge gateway
tạo rule firewall , chặn truy cập từ any vào server web port 443,
chỉ cho phép truy cập từ con proxy đến server web port 443
![image](https://github.com/user-attachments/assets/422f551c-30b9-45c5-87a4-338197a32886)




