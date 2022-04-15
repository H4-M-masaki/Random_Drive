class RenameAdressColumnToDrives < ActiveRecord::Migration[6.1]
  def change
    rename_column :drives, :adress, :address
  end
end
