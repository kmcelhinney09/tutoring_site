class OnlineResourcesController < ApplicationController
  def index
    school = School.find(params[:id])
    render json:school.online_resources
  end
end
