class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :index]

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

  def destroy
  end

  def index
    @users = User.all
  end

  def search
    @users = User.search(params[:search])
  end

end