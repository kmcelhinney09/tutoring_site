class UsersController < ApplicationController
  def index
    render json: {user: "User Data"}
  end
end

