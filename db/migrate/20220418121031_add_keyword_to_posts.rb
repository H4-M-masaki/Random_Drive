class AddKeywordToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :keyword, :text
  end
end
