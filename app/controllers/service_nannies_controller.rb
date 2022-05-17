class ServiceNanniesController < ApplicationController
  before_action :set_service, except: [:index, :new, :create]

  def index
    @service_nannies = ServiceNanny.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @service_nanny = ServiceNanny.new
    @nanny = current_user
  end

  def create
    @service_nanny = ServiceNanny.new(list_params)
    @service_nanny.user = current_user
    if @service_nanny.save
      redirect_to user_profile_path(@service_nanny)
    else
      render :new
    end
  end

  def destroy
    @service_nanny.destroy
    redirect_to service_nannies_path
  end

  private

  def set_service
    @service_nanny = ServiceNanny.find(params[:id])
  end

  def list_params
    params.require(:service_nanny).permit(:price, :days)
  end
end
