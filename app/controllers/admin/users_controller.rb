class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :index]

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
    @address_names = @user.address_names
  end

  def edit
    @user = User.find(params[:id])
    @addresses = @user.addresses
    @address_names = @user.address_names
    @address = Address.new
    @address_name = AddressName.new
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
     flash[:notice] = "編集しました"
     redirect_to admin_user_path(user)
    else
     address = Address.new
     address_name = AddressName.new
     flash[:notice] = "編集に失敗しました"
     redirect_to edit_admin_user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_user_path(@user)
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).reverse_order
  end

  def search
    @users = User.search(params[:search])
    @users_page = User.page(params[:page]).reverse_order
    render :search
  end

private
  def user_params
    params.require(:user).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phonenumber, :email)
  end
end
