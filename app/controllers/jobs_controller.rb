class JobsController < ApplicationController
  def index
    @jobs = Job.all 
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    if @job.save
      redirect_to new_job_path, notice: 'Thank You for Sending Us Job Opening Information'
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
      redirect_to root 
    else 
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:name, :email, :job_title, :location, :description, :contact_phone_number)
  end

end
