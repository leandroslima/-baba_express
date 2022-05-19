class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def new
    @service_nanny = ServiceNanny.find(params[:service_nanny_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @service_id_nanny = params[:service_nanny_id]
    @booking.service_nanny_id = @service_id_nanny
    @booking.user = current_user
    if @booking.save
      redirect_to action: "show", id: @booking.id
    else
      render :new
    end
  end


  def show
    @service_nanny_id = Booking.find(:service_nanny_id)
    @nanny = ServiceNanny.find()
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:service_nanny_id, :user_id, :date, :total_price)
  end
end
