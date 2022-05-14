class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def profile
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:email, :name, :description, :photo, :role, :city)
  end
end
