class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :m_payment_method, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.integer :status
      t.string :return_reason
      t.string :currency
      t.integer :total_invoice
      t.integer :tax_amount
      t.integer :discount_amount
      t.integer :final_invoice
      t.integer :final_invoice_incl_tax
      t.integer :payment_status

      t.timestamps
    end
  end
end
