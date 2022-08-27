class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def show
    current_user = User.find(session[:user_id])
    render json: current_user
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    session[:user_role] = user.role
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

