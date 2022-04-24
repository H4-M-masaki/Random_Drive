class Post < ApplicationRecord

  attachment :image
  attachment :profile_image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  



  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
