class RemoveDatetime < ActiveRecord::Migration
  def change
    remove_column :housings, :availability_date
    add_column :housings, :availability_date,:string
  end


end
