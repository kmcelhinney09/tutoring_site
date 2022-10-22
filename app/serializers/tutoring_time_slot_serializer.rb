class TutoringTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :tutor_capacity, :tutee_capacity, :booked_status, :date_start_time, :date_end_time
  has_many :booked_time_slots
  has_many :locations
  has_many :schools, through: :locaitons
end
