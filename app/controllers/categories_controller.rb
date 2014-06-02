class CategoriesController < ApplicationController
	def get_categories
		render :json=>Category.all
	end
end
