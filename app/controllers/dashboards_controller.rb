class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @housings = Housing.order(created_at: :desc).page params[:page]
    @jobs = Job.order(created_at: :desc).page params[:page]
    @user = current_user
    @call_list = CallList.new
  end
end
