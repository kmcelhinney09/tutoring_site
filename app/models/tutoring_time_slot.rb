class TutoringTimeSlot < ApplicationRecord
  has_many :booked_time_slots
  belongs_to :locations
  has_many :schools, through: :locaitons
end
