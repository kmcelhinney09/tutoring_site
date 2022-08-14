class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: {user: "User Data"}
  end

  def create
    user = User.create!(user_params)
    render json: user
  end


  private
  #error handleing
  def render_unprocessable_entity(invalid)
    render json:{error: invalid.record.errors}, status: :unprocessable_entity
  end

  def user_params
    params.permit(:email,:password,:full_name,:school,:grade)
  end
end

