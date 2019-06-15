# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show update destroy]

  def new; end

<<<<<<< HEAD
  def create
    address = Address.new(address_params)
    address.user_id = current_user.id
    if address.save
      redirect_to user_path(current_user)
    end
  end
=======
  def create; end
>>>>>>> header,index

  def show; end

<<<<<<< HEAD
  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end



private

  def address_params
  params.require(:address).permit(:postalcode, :address)
  end

=======
  def update; end

  def destroy; end
>>>>>>> header,index
end
