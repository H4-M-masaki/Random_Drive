class Drive < ApplicationRecord
  #MAX_DRIVES_COUNT = 5
    belongs_to :user


   geocoded_by :address
   after_validation :geocode, if: :address_changed?

#    validate :drives_count_limit

#private

# def drives_count_limit
#     errors.add(:base, "drives count limit: #{MAX_DRIVES_COUNT}") if @drives.count >= MAX_DRIVES_COUNT
# end



end
