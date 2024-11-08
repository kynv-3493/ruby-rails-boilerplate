class Category < ApplicationRecord
  include BooleanValidatable

  has_many :products, dependent: :destroy

  after_initialize :set_default_values, if: :new_record?

  validates :name, presence: true, uniqueness: true
  validates_boolean :show_products, :include_in_nav

  private

  def set_default_values
    self.show_products ||= true
    self.include_in_nav ||= true
  end
end
