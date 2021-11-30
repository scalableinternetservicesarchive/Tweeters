class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, prepend: true

    before_action :configure_permitted_parameters, if: :devise_controller?
    around_action :switch_time_zone, :if => :current_user

     def switch_time_zone(&block)
     Time.use_zone("Pacific Time (US & Canada)", &block)
     end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name,:bio,:location, :email, :password, :current_password)}
         end
end
