class BookedTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :tutor_id, :tutee_id

  belongs_to :tutoring_time_slot
end
