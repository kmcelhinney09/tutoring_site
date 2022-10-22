class School < ApplicationRecord
  has_many :locations
  has_many :tutoring_time_slots, through: :locations
  has_many :users
end
