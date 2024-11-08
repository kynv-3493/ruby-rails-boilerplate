class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :show_products
      t.boolean :include_in_nav

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end