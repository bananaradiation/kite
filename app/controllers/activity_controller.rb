class ActivityController < ApplicationController
    def index
    end
    
    def show 
        @activities = Activity.all
        respond_to do |format|
            format.html
            format.json {
                render :json => {
                    :activities => @activities
                }
            }
        end
    end
end
