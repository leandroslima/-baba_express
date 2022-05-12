class ServiceNanniesController < ApplicationController
  before_action :set_service, except: [:index,:destroy]

  def index
    @service_nannies = ServiceNanny.all
  end

  def show

  end

  def new
    @service_nanny = ServiceNanny.new
  end

  def create
    @service_nanny = ServiceNanny.new(list_params)
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

  def set_service
    @service_nanny = ServiceNanny.find(params[:id])
  end

  def list_params
    params.require(:service_nanny).permit(:user_id, :price, :days)
  end
end
