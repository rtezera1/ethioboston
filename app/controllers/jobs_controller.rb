class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit]

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    
    if @job.save && verify_recaptcha

      Notification.update  
      
      @message = Message.new
      CallList.find_each do |user|
        if user.reason == 'Jobs' || user.reason == 'Both'
          @message.send_text(user.phone_number, @job.job_title )
        end
      end
      redirect_to new_job_path, notice: 'Thank You for Sending Us Job Opening Information.'
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to new_housing_path
    else 
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:name, :email, :job_title, :location, :description, :contact_phone_number, :avatar)
  end

end
