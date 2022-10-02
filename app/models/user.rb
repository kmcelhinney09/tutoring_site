class User < ApplicationRecord
  has_secure_password
  enum role: [:tutee, :tutor, :teacher, :admin]
  has_many :tutors, class_name: 'BookedTimeSlot', foreign_key: 'tutor_id'
  has_many :tutees, class_name: 'BookedTimeSlot', foreign_key: 'tutee_id'
  has_many :teachers, class_name: 'TeacherNote', foreign_key: 'teacher_id'
  #found the info for this method from 
  #  https://stackoverflow.com/questions/4632408/understanding-source-option-of-has-one-has-many-through-of-rails
  has_many :tutor_time_slots, :through => :tutors, :source => :tutoring_time_slot
  has_many :tutee_time_slots, :through => :tutees, :source => :tutoring_time_slot

  after_initialize do
    if self.new_record?
      self.role ||= :tutee
    end
  end

  def tutor_sessions
    sessions = self.tutor_time_slots
    render_sessions = sessions.map{|session| {id:session.id, start:session.date_start_time, end:session.date_end_time}}
  end
  def tutoring_sessions
    sessions = self.tutee_time_slots
    render_sessions = sessions.map{|session| {id:session.id, start:session.date_start_time, end:session.date_end_time}}
  end

  def notes_from_teachers
    notes = TeacherNote.where(tutee_id:self.id).to_a
    teacher_notes_arry = notes.map{|note| {id:note.id, teacher_name:note.teacher.full_name, teacher_note:note.note}}
  end

  def notes_from_tutor
    notes = TutorNote.where(tutee_id:self.id).to_a
    tutor_notes_arry = notes.map{|note| {id:note.id, tutor_name:note.tutor.full_name, tutor_note:note.note}}
  end

  def class_schedules
    classes = ClassSchedule.where(student_id:self.id).to_a
  end
end
