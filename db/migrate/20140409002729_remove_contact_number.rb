class RemoveContactNumber < ActiveRecord::Migration
  def change
    remove_column :housings, :contact_number, null: false
    add_column :housings, :contact_number, :string, null: false
  end
end
