class ActivitiesController < ApplicationController
    def index
        
    end
    
    def new
        @activity = Activity.new
    end
    
    def show 
        @activities = Activity.all
        render :json => @activities
        
    end


    def create
        @activity = Activity.new(params[:activity])

        respond_to do |format|
            if @activity.save
                format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
                format.json { render action: 'show', status: :created, location: @activity }
            else
                format.html { render action: 'new' }
                format.json { render json: @activity.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def get_activities
        @activities = Activity.includes(:categories).all
        render :json => @activities
    end
    
    def get_activity
        @activity = Activity.find(params[:activity_id])
        render :json => {:activity => @activity}
    end

end
