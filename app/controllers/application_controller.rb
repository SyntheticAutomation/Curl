class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        begin
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        rescue ActiveRecord::RecordNotFound
            redirect_to logout_path
        end
    end

end
