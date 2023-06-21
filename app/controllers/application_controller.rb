class ApplicationController < ActionController::Base
    # Run this before running other methods, 
    # like index in MainController
    before_action :set_current_user 

    def set_current_user
        if session[:user_id]
            # @curr_user = User.find_by(id: session[:user_id])
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that" if Current.user.nil?
    end
end
