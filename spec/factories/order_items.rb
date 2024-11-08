FactoryBot.define do
  factory :order_item do
    order { nil }
    product { nil }
    quantity { 1 }
    total_amount { 1 }
    currency { "MyString" }
  end
end
