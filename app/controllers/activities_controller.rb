# activity {
#     id,             //Activity ID
#     name,           //Activity name
#     description,    //Activity description
#     location,       //Activity location string ***
#     category,       //Category object
#     photos[hrefs],  //Array of photo URLs
#     num_votes,      //Total number of votes for this activity ***
#     avg_vote,       //Average vote rating ***
# }

class ActivitiesController < ApplicationController


    @@SAVE = 2
    @@COMPLETE = 1

    def index
        render 'show'
    end

    def show
        @activities = Activity.all
        render :json => @activities
    end

    # //Add activity to DB
    # POST /activities/add_activity
    # Params: user_id, activity_name, description, location, category
    # Returns: success
    def add_activity
        @activity = Activity.new({
            :user => User.find_by_id(params[:user_id]), 
            :name => params[:activity][:name], 
            :description => params[:activity][:description],
            :category => Category.find_by_id(params[:activity][:category]),
			:location => params[:activity][:location]
            #:loc_x => params[:activity][:loc_x], 
            #:loc_y => params[:activity][:loc_y])
		})

            if @activity.save
				puts params[:activity].inspect
				@activity.add_photo(params[:user_id], params[:activity][:photo_url])
				render :json=>@activity
            else
                render :text=>'There was an error saving the activity.', :status=>:service_unavailable
            end
    end

    # //Gets list of activities based on category/user filter
    # GET /activities/get_activities
    # Params:
    # user_id, category_id        //filter on category or user ID if relevant
    # Returns: activities[activity]
    def get_activities
		viewer = nil
		viewer = User.find_by_id(params[:user_id]) if (params.has_key?(:user_id))
		
        @activities = Activity.getActivitiesBy2(params[:category_id], params[:user_id])
		(0...@activities.length).each {|ndx| @activities[ndx].viewer = viewer}
        render :json => @activities
    end


    # GET /activities/get_activity
    # Params: activity_id
    # Returns: activity
    def get_activity
		viewer = nil
		viewer = User.find_by_id(params[:user_id]) if (params.has_key?(:user_id))
		
        @activity = Activity.find(params[:activity_id])
		@activity.viewer = viewer if (!@activity.nil?)
		
        render :json => @activity
    end

    # //Sends user's vote on activity to database
    # POST /activities/vote_on
    # user_id = User ID,
    # activity_id = Activity ID,
    # rating = int score
    # Returns: success  
    def vote_on
        if Vote.voteOn(params[:activity_id], params[:user_id], params[:rating])
			@activity = Activity.find(params[:activity_id])
			@activity.viewer = User.find_by_id(params[:user_id])
            render :json=>@activity
        end
        return :text=>'There was an error voting for this activity', :status=>:service_unavailable
    end


    # //Marks activity as completed by user
    # POST /activities/complete_activity
    # Params: user_id, activity_id
    # Returns:success
    def complete_activity
		cond = {:user_id => params[:user_id], :activity_id => params[:activity_id], :status => @@COMPLETE}
		existing = ActivityStatus.where(cond)
		activity = Activity.find_by_id(params[:activity_id])
		activity.viewer = User.find_by_id(params[:user_id])
		
		if (existing.empty?)
			ac_status = ActivityStatus.create(cond)
			badge_sym = activity.category.description.downcase.to_sym
			userbadge = UserBadge.award_badge(params[:user_id], badge_sym)

			ac_data = JSON.parse(ActivitySerializer.new(activity).to_json)
			ac_data['activity']['award'] = userbadge.badge.name if (!userbadge.nil?)
			#activity_json.award = 
			
			render :json => ac_data.to_json and return
			#render :json => activity and return
		else
			existing.first.delete
			render :json => activity and return
		end
		
        render :text=>'There was an error marking this activity as complete.', :status=>:service_unavailable
    end


    # //Save an activity to user profile (for later reference)
    # POST /activities/save_activity
    # Params: user_id, activity_id
    # Returns: success
    def save_activity
        
        @status = ActivityStatus.where(:user => params[:user_id], :activity => params[:activity_id])
        @status = ActivityStatus.new(:user => params[:user_id], :activity => params[:activity_id], :status => @@SAVE)

        if @status.save!
            return true
        end
        return false
    end
	
	def add_photo
		activity_id = params[:activity_id]
		user_id = params[:user_id]
		url = params[:photo_url]
		
		activity = Activity.find_by_id(activity_id)
		activity.add_photo(user_id, url)
		
		render :json => activity
	end

end


# //Adds photo to activity page
# POST /activities/add_photo
# Params:
# activity_id, user_id,
# photo = TO DO LATER :(((((((((
# Returns:
# success             //Pass/fail response



