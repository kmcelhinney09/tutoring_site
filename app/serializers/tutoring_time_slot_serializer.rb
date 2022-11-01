class TutoringTimeSlotSerializer < ActiveModel::Serializer
  attributes :id_what, :id, :created_by, :tutor_capacity, :tutee_capacity, :booked_status, :date_start_time, :date_end_time
   
  has_many :booked_time_slots
  belongs_to :locations
  has_many :schools, through: :locaitons
  
  def id_what
    puts object.locations.ids
  end
end
