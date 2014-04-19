class HousingsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit]

  def show
    @housing = Housing.find(params[:id])
  end

  def new
    @housing = Housing.new
  end

  def create
    @housing = Housing.create(housing_params)
    if @housing.save && verify_recaptcha
      Notification.update 
      CallList.find_each do |user|
        @message.send_text( user.phone_number, @housing.type_of_housing )
      end
      redirect_to new_housing_path, notice: 'Thank You for Sending Us Rental Information'
    else 
      render :new
    end
  end

  def edit
    @housing = Housing.find(params[:id])
  end

  def update
    @housing = Housing.find(params[:id])
    if @housing.update(housing.params)
      redirect_to new_housing_path
    else
      render :new
    end
  end

  private

  def housing_params
    params.require(:housing).permit(:type_of_housing, :city, :state, :price, :availability_date, :contact_number, :contact_email, :avatar)
  end
end
