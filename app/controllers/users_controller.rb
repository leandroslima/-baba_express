class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def profile
    @user = User.find(current_user.id)
    @list = @user.bookings
  end
end
