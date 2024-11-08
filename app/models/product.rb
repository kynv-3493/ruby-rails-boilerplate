class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items, dependent: :destroy
  has_many :discounts, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true

  PRODUCT_PARAMS = %i(category_id name description price_cents
        weight_gams tax_rate currency delivery_quantity
        quantity_in_stock).freeze
end
