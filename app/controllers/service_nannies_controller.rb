class ServiceNanniesController < ApplicationController
  before_action :set_service, only [ :destroy]

  def index
    @service_nannies = Service_nannies.all
  end

  def new
    @service_nanny = Service_nanny.new
  end

  def create
    @service_nanny = Service_nanny.new(list_params)
    if @service_nanny.save
      redirect_to service_nanny_path(@service_nanny)
    else
      render :new
    end
  end

  def destroy
    @service_nanny.destroy
    redirect _to service_nannies_path
  end

  private

  def set_service
    @service_nanny = Service_nanny.find(prams[:id])
  end

  def list_params
    params.require(:service_nanny).permit(:user_id, :price, :days)
  end
end
