class VoteController < ApplicationController

    def index
        @vote1 = Vote.first
        @vote2 = Vote.last
        respond_to do |format|
            format.html
            format.json {
                render :json => {
                    :vote1 => @vote1,
                    :vote2 => @vote2
                }
            }
        end
    end
    
end
