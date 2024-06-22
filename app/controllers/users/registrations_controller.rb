# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: %i[edit update]

  protected

  def update_resource(resource, account_update_params)
    resource.update_without_password(account_update_params)
  end

  def after_update_path_for(_resource)
    # redirect_to [current_account, resource]
    account_user_path(current_account, current_user)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, except: %i[current_password password])
  end

  def account_update_params
    params.require(:user).permit(:avatar, :email, :password, :current_password, :first_name, :last_name, :birthdate,
                                 :gender)
  end
end
