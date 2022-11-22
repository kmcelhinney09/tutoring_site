class TutoringTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :tutors, :tutee_space, :booked_status, :date, :start_time, :end_time, :location_id, :date_sort
   
  has_many :booked_time_slots
  belongs_to :location
  belongs_to :school
  
  def date_sort
    object.date_start_time.to_f()
  end
  
  def date
    date = object.date_start_time.strftime("%A, %b %d")
  end

  def start_time
    start_time = object.date_start_time.strftime(" %l %M %p")
  end

  def end_time
    end_time = object.date_end_time.strftime(" %l %M %p")
  end

  def tutee_space
    object.tutee_space
  end

  def tutors_count
    tutors = object.tutor_capacity - object.num_tutors
  end
  def tutors
    tutors = object.tutors
    tutor_data = []
    
    tutors.each do |tutor|
      subjects = []
      tutor.subjects_signed_up.each do |sub|
        subjects.push(sub.name)
      end

      tutor_data.push({id:tutor.id, full_name:tutor.full_name, subjects_covered:subjects * ", "})
    end
    tutor_data
  end

end
