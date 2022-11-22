class BookedTimeSlotsController < ApplicationController

  def create
    booked = BookedTimeSlot.create!(tutor_id:params[:tutor_id], tutee_id:params[:tutee_id], tutoring_time_slot_id:params[:tutoring_time_slot_id])
    render json: booked, status: :created
  end
end
