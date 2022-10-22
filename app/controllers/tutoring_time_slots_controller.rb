class TutoringTimeSlotsController < ApplicationController

  def index
    time_slot = TutoringTimeSlot.first
    school = Location.find(time_slot.location_id).school
    render json: school
  end

end
