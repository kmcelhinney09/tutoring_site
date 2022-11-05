class BookedTimeSlot < ApplicationRecord
  belongs_to :tutor, class_name:"User"
  belongs_to :tutee, class_name:"User"
  belongs_to :tutoring_time_slot

  def names
    tutor = User.find(tutor_id).full_name
    tutee = User.find(tutee_id).full_name
    return {tutor_name:tutor, tutee_name:tutee}
  end
end
