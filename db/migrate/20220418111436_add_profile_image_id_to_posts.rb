class AddProfileImageIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :profile_image_id, :string
  end
end
