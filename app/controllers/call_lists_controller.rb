class CallListsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    @call_list = CallList.new
  end
  def create
    @call_list = CallList.new(call_params)
    if @call_list.save
      redirect_to user_root_path
      flash[:notice] = "Thank You"
    else
      flash[:notice] = "DIDNT WORK"
      redirect_to user_root_path   
    end
  end

  private

  def call_params
    params.require(:call_list).permit(:phone_number, :reason).merge(user: current_user)
  end

end
