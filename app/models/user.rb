class User < ApplicationRecord
  has_secure_password
  enum role: [:tutee, :tutor, :teacher, :admin]
  has_many :booked_time_slots, foreign_key: 'tutee_id'
  has_many :tutors, class_name: 'BookedTimeSlot', foreign_key: 'tutor_id'
  has_many :tutees, class_name: 'BookedTimeSlot', foreign_key: 'tutee_id'
  has_many :teachers, class_name: 'TeacherNote', foreign_key: 'teacher_id'
  has_many :tutor_slot_sign_ups, class_name: 'TutorSlotSignUp', foreign_key: 'tutor_id'
  has_many :student_schedule, class_name: 'ClassSchedule', foreign_key: 'student_id'
  has_many :teacher_schedule, class_name: 'ClassSchedule', foreign_key: 'teacher_id'
  
  belongs_to :school

  after_initialize do
    if self.new_record?
      self.role ||= :tutee
    end
  end

  def notes_from_teachers
    notes = TeacherNote.where(tutee_id:self.id).to_a
    teacher_notes_arry = notes.map{|note| {id:note.id, teacher_name:note.teacher.full_name, teacher_note:note.note}}
  end

  def notes_from_tutor
    notes = TutorNote.where(tutee_id:self.id).to_a
    tutor_notes_arry = notes.map{|note| {id:note.id, tutor_name:note.tutor.full_name, tutor_note:note.note}}
  end

end
