class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for(service_center)
    sc_dashboard_requests_path
  end

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
