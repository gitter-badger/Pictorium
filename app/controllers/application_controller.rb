class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_paramaters, if: :devise_controller?

  private
  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, 
           keys: [:userinfo_attributes => [:id, :user_name, :profile, :posted_count, :bookmark_count]])
  end
end
