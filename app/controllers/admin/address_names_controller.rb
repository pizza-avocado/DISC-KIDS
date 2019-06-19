# frozen_string_literal: true

class Admin::AddressNamesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end
  def create
    address_name = AddressName.new(address_name_params)
    address_name.user_id = @user.id
    if address_name.save
      redirect_to admin_user_path(@user)
    end
  end
  
  def show; end
  def update
    @address_name = address_name.find(params[:id])
    if @address_name.update
      redirect_to admin_user_path(@address_name)
    end
  end

  def destroy
  end



private

  def address_name_params
    params.require(:address_name).permit(:address_name,)
  end
end

