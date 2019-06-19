# frozen_string_literal: true

<<<<<<< HEAD
  before_action :authenticate_user!,  only: [:new, :create, :show, :edit, :update, :destroy]
=======
class AddressNamesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show update destroy]
>>>>>>> header,index

  def new; end

<<<<<<< HEAD
  def create
    address_name = AddressName.new(address_name_params)
    address_name.user_id = current_user.id
    if address_name.save
      redirect_to user_path(current_user)
    end
  end
=======
  def create; end
>>>>>>> header,index

  def show; end

<<<<<<< HEAD
  def edit
     @address_name = AddressName.find(params[:id])
  end

  def update
    address_name = AddressName.find(params[:id])
    if address_name.update(address_name_params)
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end



private

  def address_name_params
      params.require(:address_name).permit(:address_name)
  end

=======
  def update; end

  def destroy; end
>>>>>>> header,index
end
