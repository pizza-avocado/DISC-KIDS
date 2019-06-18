class UsersController < ApplicationController

  before_action :authenticate_user!,  only: [:show, :edit, :update, :resign, :destroy]

  def show
  	@user = User.find(params[:id])
  	@addresses = current_user.addresses
  	@address_names = current_user.address_names
  end

  def edit
    @user = User.find(params[:id])
    @addresses = current_user.addresses
    @address_names = current_user.address_names
    @address = Address.new
    @address_name = AddressName.new
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
    	redirect_to user_path(current_user)
    end
  end

  def resign
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phonenumber)
  end

end
