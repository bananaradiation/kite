class UsersController < ApplicationController

    def login
        user = User.first
        render :json => user
    end

    def get_profile
        @user = User.find(params[:id])
        @profile = []   
        @profile << @user.id << @user.name << @user.badges << @user.saved << user.completed
        render :json => @profile
    end
end


# //Checks DB for user details and logs in
# POST /users/login
# Params:
# email, password
# Returns:
# user, success           //User object and pass/fail response


# //Signs up user on Kite
# POST /users/signup
# Params:
# user_name, user_email, user_password
# Returns:
# user