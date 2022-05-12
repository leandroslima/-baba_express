class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = Booking.new
    @service_nanny = ServiceNanny.find(params[:service_nanny_id])
  end

  def create

    @booking = Booking.new(booking_params)
    Booking.create!(user_id: current_user.id,service_nanny_id: (params[:service_nanny_id]))
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end


  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def list_params
    params.require(:booking.permit(:service_nanny_id, :user_id, :date))
  end
end
