class DashboardsController < ApplicationController
  def index
    
    @housings = Housing.all 
    @jobs = Job.all 
  end
end
