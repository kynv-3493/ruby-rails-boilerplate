class Discount < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true
end
