class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
    private
   
    def user_not_authorized
   
      flash[:alert] = "You are not authorize to perform this action"
      redirect_to projects_path
    end











    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end
