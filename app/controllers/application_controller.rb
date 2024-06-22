class ApplicationController < ActionController::Base
  add_flash_types :info, :warning, :success, :error

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[avatar email password current_password first_name
                                               last_name birthdate gender])
  end
end
