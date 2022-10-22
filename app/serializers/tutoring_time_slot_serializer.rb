class TutoringTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :tutor_capacity, :tutee_capacity, :booked_status, :location_id, :date_start_time, :date_end_time
  belongs_to :location
end
