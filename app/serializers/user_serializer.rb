class UserSerializer < ActiveModel::Serializer
  attributes :full_name,:school_id,:grade,:role, :teacher_notes, :tutor_notes
  has_many :booked_time_slots, foreign_key: 'tutee_id'
  has_many :tutor_slot_sign_ups, class_name: 'TutorSlotSignUp', foreign_key: 'tutor_id'
  has_many :student_schedule, class_name: 'ClassSchedule', foreign_key: 'student_id'
  belongs_to :school

  def booked_time_slots
    slots = object.booked_time_slots
    slots.map{|slot| TutoringTimeSlot.find(slot.tutoring_time_slot_id)}
  end

  def teacher_notes
    object.notes_from_teachers
  end

  def tutor_notes
    object.notes_from_tutor
  end
end
