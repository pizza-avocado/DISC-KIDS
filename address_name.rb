# frozen_string_literal: true

class Admin::AddressNamesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end

  def create
    address_name = AddressName.new(address_name_params)
    address_name.user_id = params[:user_id]
    if address_name.save
      flash[:notice] = "宛名を追加しました"
      redirect_to admin_user_path
    else
      address = AddressName.find(params[:id])
      flash[:notice] = "宛名の追加に失敗しました"
      redirect_to admin_user_path
    end
  end

  def show; end

  def edit
    @address_name = AddressName.find(params[:id])
  end

  def update
    @address_name = AddressName.find(params[:id])
    if @address_name.update(address_name_params)
       flash[:notice] = "宛名を編集しました"
       redirect_to admin_user_path
    else
      @address = AddressName.find(params[:id])
      flash[:notice] = "宛名の編集に失敗しました"
      redirect_to admin_user_path
    end
  end

  def destroy
    address_name = AddressName.find(params[:id])
    if address_name.destroy(address_name_params)
      flash[:notice] = "宛名を削除しました"
      redirect_to edit_admin_user_path
    else
      flash[:notice] = "宛名削除に失敗しました"
      redirect_to edit_admin_user_path
    end
  end



private

  def address_name_params
    params.require(:address_name).permit(:address_name)
  end
end

