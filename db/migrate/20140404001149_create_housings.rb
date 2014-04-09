class CreateHousings < ActiveRecord::Migration
  def change
    create_table :housings do |t|
      t.string :type_of_housing, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :price, null: false
      t.datetime :availability_date, null: false
      t.integer :contact_number, null: false
      t.string :contact_email, null: false

      t.timestamps
    end
  end
end
