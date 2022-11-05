class TutoringTimeSlot < ApplicationRecord
  has_many :booked_time_slots
  has_many :tutor_slot_sign_ups
  belongs_to :location
  belongs_to :school

  def open_tutoring_slots
    booked = self.booked_time_slots
    tutors_list = booked.map(&:tutor_id)
    num_tutors = tutors_list.uniq.count
  end
  def open_tutor_slots

  end
end
