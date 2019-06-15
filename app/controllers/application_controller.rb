class ApplicationController < ActionController::Base

	# before_action :set_search

	def after_sign_in_path_for(resource)
  		root_path
	end

	# def set_search
	# 	@search = Item.ransack(params[:q])
	# 	@search_items = @search.result
	# end

end
 