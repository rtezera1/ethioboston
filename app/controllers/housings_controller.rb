class HousingsController < ApplicationController
  def index
    @housings = Housing.all
  end

  def show
    @housing = Housing.find(params[:id])
  end

  def new
    @housing = Housing.new
  end

  def create
    @housing = Housing.create(housing_params)
    if @housing.save
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
      redirect_to root
    else
      render :new
    end
  end

  private

  def housing_params
    params.require(:housing).permit(:type_of_housing, :city, :state, :price, :availability_date, :contact_number, :contact_email)
  end
end
