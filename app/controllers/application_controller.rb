class ApplicationController < ActionController::Base
include ApplicationHelper
#before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
