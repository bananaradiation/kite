class UsersController < ApplicationController

    def index
        @user1 = User.first
        @user2 = User.last
        respond_to do |format|
            format.html
            format.json {
                render :json => {
                    :user1 => @user1,
                    :user2 => @user2
                }
            }
        end
    end

    def login
        user = User.first
        render :json => user
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