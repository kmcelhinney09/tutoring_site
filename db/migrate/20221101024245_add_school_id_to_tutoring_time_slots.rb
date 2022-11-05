class AddSchoolIdToTutoringTimeSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :tutoring_time_slots, :school_id, :integer
  end
end
