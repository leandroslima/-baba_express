class ServiceNanniesController < ApplicationController
  before_action :set_service, except: [:index, :new, :create]

  def index
    @service_nannies = ServiceNanny.all
  end

  def show
    @booking = Booking.new
    @description = @service_nanny.user
    @teste = params[:id_user]
    
  end

  def calculate
    @price = params[:service_nanny][:price]
    @days = params[:service_nanny][:days]
    @total_price = @price.to_i * @days.to_i
    redirect_to action: "show", id_user: @total_price
  end

  def new
    @service_nanny = ServiceNanny.new
    @nanny = current_user
  end

  def create
    @service_nanny = ServiceNanny.new(service_nanny_params)
    @service_nanny.user = current_user
    if @service_nanny.save
      redirect_to user_profile_path(@service_nanny)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @service_nanny.update(service_nanny_params)
    redirect_to service_nanny_path(@service_nanny)
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

  def service_nanny_params
    params.require(:service_nanny).permit(:price, :days, :user_id)
  end
end
