class BookedTimeSlot < ApplicationRecord
  belongs_to :tutor, class_name:"User"
  belongs_to :tutee, class_name:"User"
  belongs_to :tutoring_time_slot
end
