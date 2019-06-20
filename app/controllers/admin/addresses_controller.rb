# frozen_string_literal: true

class Admin::AddressesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end

  def create
    address = Address.new(address_params)
    address.user_id = params[:user_id]
    if address.save
      redirect_to admin_user_path(address.user_id)
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
       redirect_to admin_user_path(address.user_id)
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to admin_user_path(address.user_id)
  end

private

  def address_params
  params.require(:address).permit(:postalcode, :address)
  end
end
