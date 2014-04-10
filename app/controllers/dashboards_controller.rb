class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @housings = Housing.all 
    @jobs = Job.all 
  end
end
