class BadgeController < ApplicationController

	def set_photo
		@photo = params[:url]
		@badge = Badge.find(params[:id])
		@badge.photo = @photo
		if @badge.save!
			return true
		else
			return false
	end


end
