<<<<<<< HEAD
class ApplicationController < ActionController::Base

	# before_action :set_search

	def after_sign_in_path_for(resource)
  		root_path
	end



=======
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    root_path
  end
>>>>>>> header,index
end
 