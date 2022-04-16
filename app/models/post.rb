class Post < ApplicationRecord

  attachment :image
  attachment :profile_image

  belongs_to :user
  has_many :post_comments, dependent: :destroy

end
