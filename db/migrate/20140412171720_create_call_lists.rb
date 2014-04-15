class CreateCallLists < ActiveRecord::Migration
  def change
    create_table :call_lists do |t|
      t.string :phone_number, null: false
      t.string :user_id, null: false
      t.string :reason, null: false

      t.timestamps
    end
  end
end
