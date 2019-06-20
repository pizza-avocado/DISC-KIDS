# frozen_string_literal: true

class Admin::AddressNamesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end

  def create
    address_name = AddressName.new(address_name_params)
    address_name.user_id = params[:user_id]
    if address_name.save
      redirect_to admin_user_path(address_name.user_id)
    end
  end

  def show; end

  def edit
    @address_name = AddressName.find(params[:id])
  end

  def update
    address_name = AddressName.find(params[:id])
    if address_name.update(address_name_params)
       redirect_to admin_user_path(address_name.user_id)
    end
  end

  def destroy
    address_name= AddressName.find(params[:id])
    address_name.destroy
    redirect_to admin_user_path(address_name.user_id)
  end



private

  def address_name_params
    params.require(:address_name).permit(:address_name)
  end
end

