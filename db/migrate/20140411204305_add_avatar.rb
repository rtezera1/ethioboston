class AddAvatar < ActiveRecord::Migration
  def change
    add_column :jobs, :avatar, :string
    add_column :housings, :avatar, :string
  end
end
