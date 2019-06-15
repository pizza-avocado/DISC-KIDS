class ApplicationController < ActionController::Base

	# before_action :set_search

	def after_sign_in_path_for(resource)
  		root_path
	end



end
 