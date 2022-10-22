class TutoringTimeSlot < ApplicationRecord
  has_many :booked_time_slots
  has_many :locations
  has_many :schools, through: :locaitons
end
