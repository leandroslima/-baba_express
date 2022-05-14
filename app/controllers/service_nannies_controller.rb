class ServiceNanniesController < ApplicationController
  before_action :set_service, except: [:index, :new]
  before_action :set_user, only: [:new, :create]

  def index
    @service_nannies = ServiceNanny.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @service_nanny = ServiceNanny.new
  end

  def create
    @service_nanny = ServiceNanny.new(service_params)
    @service_nanny.user = current_user
    if @service_nanny.save
      redirect_to service_nanny_path(@service_nanny)
    else
      render :new
    end
  end

  def destroy
    @service_nanny.destroy
    redirect_to service_nannies_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_service
    @service_nanny = ServiceNanny.find(params[:id])
  end

  def service_params
    params.require(:service_nanny).permit(:price, :days, :user_id)
  end
end
