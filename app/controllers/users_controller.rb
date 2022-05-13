class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def profile
    @user = User.find_by(username: params[:username])
  end
end
