class Post < ApplicationRecord

  attachment :image
  attachment :profile_image

  belongs_to :user
end
