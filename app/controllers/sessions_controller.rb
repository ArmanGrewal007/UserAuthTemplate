class SessionsController < ApplicationController
    def new 
    end

    def create 
        # One thing to note here is that params returned is not hash of hashes
        # But a simple hash with keys 
        curr_user = User.find_by(email: params[:email])
        if curr_user.present? && curr_user.authenticate(params[:password])
            session[:user_id] = curr_user.id
            redirect_to root_path, notice: "Logged in successfully"
        else 
            flash[:alert] = "Invalid email or password"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end