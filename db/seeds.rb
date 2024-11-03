10.times do |i|
  User.create!(
    email: "user#{i.zero? ? '' : i}@example.com",
    password: "password",
    confirmed_at: Time.now
  )
end
