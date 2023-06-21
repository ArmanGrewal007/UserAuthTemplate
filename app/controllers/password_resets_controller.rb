class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present? 
            # Send email in background
            # deliver_now will make your rails app slow to respond
            PasswordMailer.with(user: @user).reset.deliver_now        
        end
        
        # Always do a redirect coz we don't want anyone to know 
        # if that account actually exits in your DB,
        # As this allows for dictionary attacks
        redirect_to root_path, notice: "If the user exists, password reset request is sent to your email!"
    end

    def edit 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature
            redirect_to sign_in_path, alert: "Your token has expired! Please try again..."
    end

    def update 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params) 
            redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end