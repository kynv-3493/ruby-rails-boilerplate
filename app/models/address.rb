class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :district, :city, :country, presence: true
end
