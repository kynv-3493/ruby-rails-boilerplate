class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :district
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
