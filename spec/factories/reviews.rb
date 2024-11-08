FactoryBot.define do
  factory :review do
    user { nil }
    rating { 1 }
    comment { "MyString" }
    image_url { "MyString" }
  end
end
