class AddIndex < ActiveRecord::Migration
  def change
    add_index :call_lists, :user_id, unique: true
  end
end
