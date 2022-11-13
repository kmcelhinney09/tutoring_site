class Location < ApplicationRecord
  belongs_to :school
  belongs_to :building
  has_many :tutoring_time_slots
end
