FactoryBot.define do
  factory :product do
    category { nil }
    name { "MyString" }
    description { "MyString" }
    price_cents { 1 }
    weight_gams { 1 }
    tax_rate { 1 }
    currency { "MyString" }
    delivery_quantity { 1 }
    quantity_in_stock { 1 }
  end
end
