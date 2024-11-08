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

## 1. Devise

### Checklist devise (10 tiêu chí)

- [x] Database Authenticatable: mã hóa và lưu trữ một mật khẩu vào cơ sở dữ liệu để xác nhận tính xác thực của người dùng trong khi đăng nhập.
- [] Confirmable: Gửi mail bằng sidekiq. Config lại mail template
- [x] Recoverable: Lấy lại tài khoản, đổi lại mật khẩu
- [x] Registerable: chỉnh sửa và xoá các tài khoản
- [x] Rememberable:
- [x] Trackable:
- [x] Timeoutable: phiên hết thời hạn
- [x] Validatable
- [x] Lockable
- [x] Omniauthable: đăng nhập bằng tài khoản như Google, Facebook

```bash
env.example
bỏ 2 cặp xxx ở đầu cuối đi
```

# Appendix

## Các câu lệnh để generate ra schema

```bash
rails generate devise User
rails generate migration AddOmniauthToUsers provider:string uid:string
rails generate migration AddInfoToUsers username:string role:integer phone:string

rails generate scaffold Review user:references rating:integer comment:string image_url:string
rails generate scaffold Address user:references address1:string address2:string address3:string district:string city:string country:string
rails generate scaffold Category name:string show_products:boolean include_in_nav:boolean
rails generate scaffold Product category:references name:string:index description:string price_cents:integer:index weight_gams:integer tax_rate:integer currency:string delivery_quantity:integer quantity_in_stock:integer
rails generate scaffold M::PaymentMethod name:string
rails generate scaffold Order user:references m_payment_method:references address:references status:integer return_reason:string currency:string total_invoice:integer tax_amount:integer discount_amount:integer final_invoice:integer final_invoice_incl_tax:integer payment_status:integer
rails generate scaffold OrderItem order:references product:references quantity:integer total_amount:integer currency:string
rails generate scaffold Cart user:references
rails generate scaffold CartItem cart:references product:references quantity:integer
rails generate scaffold Discount product:references user:references discount_rate:integer status:integer start_time:datetime end_time:datetime

```

## Tài liệu học tập

1. Basic Clone amazon rails - https://github.com/stephant98/Jungle
2. Clone airbnb - https://www.youtube.com/watch?v=GUL_42lNChY&list=PLoDt3UyLUtch1KR0U_UZ9GXJ5NRe-7BAh&index=11

- Github repo: https://github.com/rt4914/airbnb
- Học các kiến thức cơ bản
- Học cách fixbug
