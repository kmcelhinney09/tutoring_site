class School < ApplicationRecord
  has_many :locations
  has_many :tutoring_time_slots
  has_many :users
  has_many :online_resources
end
