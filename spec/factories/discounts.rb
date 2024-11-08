FactoryBot.define do
  factory :discount do
    product { nil }
    user { nil }
    discount_rate { 1 }
    status { 1 }
    start_time { "2024-11-08 21:23:59" }
    end_time { "2024-11-08 21:23:59" }
  end
end
