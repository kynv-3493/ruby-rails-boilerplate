class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price_cents
      t.integer :weight_gams
      t.integer :tax_rate
      t.string :currency
      t.integer :delivery_quantity
      t.integer :quantity_in_stock

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :price_cents
  end
end
