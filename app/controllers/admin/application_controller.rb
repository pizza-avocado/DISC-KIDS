class Admin::ApplicationController < ActionController::Base

  def after_sign_in_path_for(_resource)
    admin_items_path
  end
end
