class CreateMPaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :m_payment_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
