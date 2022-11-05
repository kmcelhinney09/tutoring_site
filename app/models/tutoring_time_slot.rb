class TutoringTimeSlot < ApplicationRecord
  has_many :booked_time_slots
  has_many :tutor_slot_sign_ups
  belongs_to :location
  belongs_to :school

  def booked_update
    booked = self.booked_time_slots
    tutee_list = booked.map(&:tutee_id)
    num_tutee = tutee_list.uniq.count
    tutee_capacity = self.tutee_capacity
    if num_tutee >= tutee_capacity
      self.booked_status = true
    else
      self.booked_status = false
    end
  end

  def open_tutor_slots
    signed_up = self.tutor_slot_sign_ups
  end
end
