class TutoringTimeSlot < ApplicationRecord
  has_many :booked_time_slots
  belongs_to :location

end
