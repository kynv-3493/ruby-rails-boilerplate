class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :m_payment_method
  belongs_to :address

  has_many :order_items, dependent: :destroy

  enum :status, %i(pending confirmed processing delivered returned cancelled),
       default: :pending, validate: true

  after_initialize :set_default_values, if: :new_record?

  validates :user_id, :m_payment_method, :address_id, :status, :currency,
            presence: true

  ORDER_PARAMS = %i(user_id m_payment_method_id address_id status return_reason
                    currency total_invoice tax_amount discount_amount
                    final_invoice final_invoice_incl_tax).freeze

  private

  def set_default_values
    self.status ||= :pending
  end
end
