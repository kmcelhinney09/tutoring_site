class SessionsController < ApplicationController
  skip_before_action :authorized, only: :create
  
end
