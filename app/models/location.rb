class Location < ApplicationRecord
  belongs_to :school
  belongs_to :tutoring_time_slot
end
