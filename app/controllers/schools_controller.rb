class SchoolsController < ApplicationController

  def index
    school = School.find(params[:id])
    render json:school
  end
end
