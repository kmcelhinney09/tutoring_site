class User < ApplicationRecord
  has_secure_password
  enum role: [:tutee, :tutor, :teacher, :admin]
  has_many :tutors, class_name: 'BookedTimeSlot', foreign_key: 'tutor_id'
  has_many :tutees, class_name: 'BookedTimeSlot', foreign_key: 'tutee_id'
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
  end
  def tutoring_sessions
    sessions = self.tutee_time_slots
  end
end
