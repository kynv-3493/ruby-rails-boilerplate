FactoryBot.define do
  factory :address do
    user { nil }
    address1 { "MyString" }
    address2 { "MyString" }
    address3 { "MyString" }
    district { "MyString" }
    city { "MyString" }
    country { "MyString" }
  end
end
