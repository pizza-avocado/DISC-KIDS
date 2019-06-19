# frozen_string_literal: true

class Admin::AddressesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end

  def create
    address = Address.new(address_params)
    address.user_id = @user.id
    if address.save
      redirect_to admin_user_path(@user)
    end
  end

  def update
    address = address.find(params[:id])
    if address.update
       redirect_to admin_user_path(@user)
    end
  end

  def destroy
  end

private

  def address_params
  params.require(:address).permit(:postalcode, :address)
  end
end
