class Location < ApplicationRecord
  belongs_to :school
  has_many :tutoring_time_slot
end
