# Rails tutorial - Sample App

# 1. Phiên bản cài đặt để chạy được dự án:
- Ruby: 3.2.2
- Rails: 7.0.7
- MySQL

# 2. Hướng dẫn cài dự án:
## 2.1 Cài đặt config(chỉ chạy lần đầu)
- Tạo config database cho dự án: cp config/database.yml.example config/database.yml
- Chạy lệnh để tạo database: rails db:create
- Bật server: rails s
Truy cập đường dẫn http://localhost:3000/ hiển thị Rails là thành công
```bash
cp config/database.yml.example config/database.yml
cp .env.example .env
rails db:create db:migrate db:seed
rails s -b 0
# Or if installed tailwind rails
bin/dev

# Check coverage
## Mac
open coverage/index.html

## Ubuntu
xdg-open coverage/index.html
```

# 3. Các library cần áp dụng