class ActivitiesController < ApplicationController
    def index
        
    end
    
    def new
        @activity = Activity.new
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
        puts :activity_id
        respond_to do |format|
            format.html
            format.json {
                render :show
            }
        end
    end

end
