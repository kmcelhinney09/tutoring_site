class SessionsController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: {error: {login: "invalid email or password"}}, status: :unauthorized
    end
  end

  def info
    current_user = User.find(session[:user_id])
    user_info = [current_user, current_user.tutoring_sessions, current_user.tutor_sessions, current_user.notes_from_tutor, current_user.notes_from_teachers, current_user.class_schedule]
    render json: user_info
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
