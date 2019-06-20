class AddressNamesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show update destroy]

  def new; end

  def create
    address_name = AddressName.new(address_name_params)
    address_name.user_id = current_user.id
    if address_name.save
      redirect_to user_path(current_user)
    end
  end


  def show; end

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


end
