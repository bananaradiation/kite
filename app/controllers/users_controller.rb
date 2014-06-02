class UsersController < ApplicationController
	#Authenticate user
    def login
		email = params[:email]
		password = params[:password]
		
		#Note: Password stored as plaintext in DB
		user = User.where({:email=>email, :password=>password}).first
		
		#User not found
		if (user.nil?)
			render :text => 'User not found.', :status=>:unauthorized
		#User found
		else
			render :json=>user
		end
    end

	#Get user profile
    def get_profile
        id = params[:id]
		user = User.find_by_id(params[:id])
		
		#User not found
		if (user.nil?)
			render :text => 'User not found', :status=>:unauthorized
		#User found
		else
			render :json=>user
		end
		
		#@user = User.find(params[:id])
        #@profile = []   
        #@profile << @user.id << @user.name << @user.badges << @user.saved << user.completed
        #render :json => @profile
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