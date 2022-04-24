class Drive < ApplicationRecord

    belongs_to :user



   validates :address, presence: true

   geocoded_by :address
   after_validation :geocode, if: :address_changed?




end
