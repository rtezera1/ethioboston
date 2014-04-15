class ChangeUserId < ActiveRecord::Migration
  def change
    remove_column :call_lists, :user_id, :string
    add_column :call_lists, :user_id, :integer
  end
end
