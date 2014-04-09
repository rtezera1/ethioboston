class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :job_title, null: false
      t.string :location, null: false
      t.string :description, null: false
      t.string :contact_phone_number, null: false

      t.timestamps
    end
  end
end
