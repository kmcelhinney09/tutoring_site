class BookedTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :tutor_id, :tutee_id
end
