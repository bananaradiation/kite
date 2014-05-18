class ActivitiesController < ApplicationController
    def index
    end
    
    def new
        @activity = Activity.new(params[:activity])
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


    def create
    end
    
    
end
