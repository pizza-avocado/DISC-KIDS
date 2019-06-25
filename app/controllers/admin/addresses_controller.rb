# frozen_string_literal: true

class Admin::AddressesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end

  def create
    address = Address.new(address_params)
    address.user_id = params[:user_id]
    if address.save
      flash[:notice] = "送付先を追加しました"
      redirect_to admin_user_path(address.user_id)
    else
      flash[:notice] = "送付先の追加に失敗しました"
      redirect_to edit_admin_user_path(address.user_id)
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = "送付先を編集しました"
      redirect_to admin_user_path(address.user_id)
    else
      flash[:notice] = "送付先の編集に失敗しました"
      redirect_to edit_admin_user_path(address.user_id)
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice] = "送付先を削除しました"
      redirect_to admin_user_path(address.user_id)
    else
      flash[:notice] = "送付先の削除に失敗しました"
      redirect_to edit_admin_user_path(address.user_id)
    end
  end


private

  def address_params
  params.require(:address).permit(:postalcode, :address)
  end
end
