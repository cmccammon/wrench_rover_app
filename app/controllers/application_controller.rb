class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!



  private
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_auto_path
      end
    end
end
