class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update resign destroy]

  def show
  	@user = User.find(params[:id])
  	@addresses = current_user.addresses
  	@address_names = current_user.address_names
  end

  def edit
    @user = User.find(params[:id])
    @address = Address.new
    @address_name = AddressName.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集しました"
      redirect_to user_path(current_user)
    else
      @address = Address.new
      @address_name = AddressName.new
      flash[:notice] = "編集に失敗しました"
      redirect_to edit_user_path(current_user)
    end
  end

  def resign
    @user = current_user
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:email, :lastname, :firstname, :lastname_kana, :firstname_kana,
    						                 :phonenumber, :postalcode, :address)
  end

  def correct_user
   	@user = User.find(params[:id])
   	redirect_to user_path(current_user) unless @user == current_user

  end
end
