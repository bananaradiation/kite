class UserController < ApplicationController
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
end
