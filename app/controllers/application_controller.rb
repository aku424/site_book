class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def authenticate_user
    if current_user == nil
      redirect_to  homes_top_path
    end
   end

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
        devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end

end
