class Order < ApplicationRecord
  belongs_to :user
  belongs_to :m_payment_method
  belongs_to :address
end
