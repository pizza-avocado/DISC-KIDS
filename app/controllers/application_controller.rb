class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
  		root_path
    elsif current_admin
       admin_items_path
    end
  end

  def after_sign_up_path_for(resource)
  		if current_user
      root_path
    elsif current_admin
       admin_items_path
    end
  end

  def after_sign_out_path_for(resource)
  		root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phonenumber])
  end

end