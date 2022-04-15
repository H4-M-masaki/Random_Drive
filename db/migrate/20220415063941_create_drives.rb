class CreateDrives < ActiveRecord::Migration[6.1]
  def change
    create_table :drives do |t|

      t.integer :user_id
      t.string :adress

      t.timestamps
    end
  end
end
