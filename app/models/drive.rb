class Drive < ApplicationRecord
  MAX_DRIVES_COUNT = 5
    belongs_to :user

#    validate :drives_count_limit

#private

# def drives_count_limit
#     errors.add(:base, "drives count limit: #{MAX_DRIVES_COUNT}") if @drives.count >= MAX_DRIVES_COUNT
# end



end
