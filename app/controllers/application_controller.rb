class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #test
  def after_sign_in_path_for(resource)
    service_nannies_path(current_user.id)
  end
end
