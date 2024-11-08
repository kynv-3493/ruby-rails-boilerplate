FactoryBot.define do
  factory :order do
    user { nil }
    m_payment_method { nil }
    address { nil }
    status { 1 }
    return_reason { "MyString" }
    currency { "MyString" }
    total_invoice { 1 }
    tax_amount { 1 }
    discount_amount { 1 }
    final_invoice { 1 }
    final_invoice_incl_tax { 1 }
  end
end
