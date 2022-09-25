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

    tutor_sessions = current_user.tutor_sessions
    if current_user.role == "tutor"
      tutoring_sessions = current_user.tutoring_sessions
    end
    user_info = [current_user,tutor_sessions,tutoring_sessions,tutor_sessions]
    render json: user_info
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
