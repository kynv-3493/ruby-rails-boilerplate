FactoryBot.define do
  factory :category do
    name { "MyString" }
    show_products { false }
    include_in_nav { false }
  end
end
