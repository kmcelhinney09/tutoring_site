class TutoringTimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :tutors_count, :tutee_space, :booked_status, :date, :start_time, :end_time, :location_id, :subjects_covered
   
  has_many :booked_time_slots
  belongs_to :location
  belongs_to :school
  
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

  def subjects_covered
    subjects = []
    tutors = object.tutors
    tutors.each do |tutor|
      selected_subjects = tutor.subjects_signed_up
      selected_subjects.each do |subject|
        subjects.push(subject.name)
      end
    end
    return subjects * ", "
  end

end
