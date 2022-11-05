class TutoringTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :tutor_capacity, :tutee_capacity, :booked_status, :date_start_time, :date_end_time, :location_id, :booked
   
  has_many :booked_time_slots
  belongs_to :location
  belongs_to :school
  
  def booked
    booked_slots = object.booked_time_slots
    student_names = booked_slots.map{|slot| slot.names}
  end
end
