class RegistrationsController < ApplicationController
    def new
        @new_user = User.new 
    end
    def create
        # render plain: params[:user] # Renders simple text
        # Similar to User.new(email: "...", password: "...", password_confirmation: "...")
        # @user = User.new(params[:user]) # NOT SECURE
        @new_user = User.new(user_params)
        if @new_user.save # If user is saved to the database, go to home page
            session[:user_id] = @new_user.id
            redirect_to root_path , notice: "Successfuly created account"
        else # Else render the new signup page again
            render :new, status: :unprocessable_entity
        end
    end
    # Create a private helper method to 
    private
    def user_params
        # params[:user] # Same thing but no error handling
        # params.require(:user) # Raises an error if user not found
        params.require(:user).permit(:email, :password, :password_confirmation) # These are 
                                                                # the only things allowd to set
    end
end