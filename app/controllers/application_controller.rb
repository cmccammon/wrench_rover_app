class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  protected


  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == ServiceCenter
      ServiceCenter::ParameterSanitizer.new(ServiceCenter, :service_center, params)
    else
      super # Use the default one
    end
  end

end
