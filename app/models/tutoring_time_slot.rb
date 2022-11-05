class TutoringTimeSlot < ApplicationRecord
  has_many :booked_time_slots
  belongs_to :location
  belongs_to :school

  def open_slots
    booked = self.booked_time_slots
    tutors_list = booked.map(&:tutor_id)
    num_tutors = tutors_list.uniq.count
  end
end
