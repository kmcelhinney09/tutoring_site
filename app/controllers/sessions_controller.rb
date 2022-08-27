class SessionsController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_role] = user.role
      render json: user, status: :created
    else
      render json: {error: {login: "invalid email or password"}}, status: :unauthorized
    end
  end
end
