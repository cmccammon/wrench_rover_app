class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
     # check for the class of the object to determine what type it is
     if resource.class == User && resource.sign_in_count == 1
       new_auto_path
     elsif resource.class == ServiceCenter
       sc_dashboard_requests_path
     else
       requests_path
     end
   end

   private
     def authenticate_user!
       if user_signed_in?
         super
       else
         redirect_to new_user_registration_path, notice: "Please Login to view that page!" if request.original_fullpath != new_user_registration_path
       end
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
