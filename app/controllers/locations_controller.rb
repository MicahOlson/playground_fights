class LocationsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @locations = Location.all
    render :index
  end

  def new
    @location = Location.new
    render :new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = 'Location was successfully created'
      redirect locations_path
    else
      flash[:notice] = 'Location was not successfully created'
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
    render :show
  end

  def edit
    @location = Location.find(params[:id])
    render :edit
  end

  def update
    @location = Location.find(params[:id])
    if @location.update
      flash[:notice] = 'Location was successfully updated'
      redirect location_path
    else
      flash[:notice] = 'Location was not successfully updated'
      redirect :edit
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:notice] = 'Location was successfully deleted'
    redirect locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name, :description)
  end
end
