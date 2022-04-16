class AddLatitudeToDrives < ActiveRecord::Migration[6.1]
  def change
    add_column :drives, :latitude, :float
    add_column :drives, :longitude, :float
  end
end
