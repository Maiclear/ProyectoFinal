class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: 'Tu no tienes permiso para hacer esto!!! FUERAA'
  end

  protect_from_forgery with: :exception

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name , :lastname , :address, :rut , :role, :avatar, :avatar_cache, :remote_avatar_url]
      devise_parameter_sanitizer.for(:account_update) << [:name , :lastname , :address, :rut , :role, :avatar, :avatar_cache, :remote_avatar_url]
    end


end
