class AddressNamesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show update destroy]

  def new; end

  def create
    address_name = AddressName.new(address_name_params)
    address_name.user_id = current_user.id
    if address_name.save
      flash[:notice] = "宛名を追加しました"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "宛名の追加に失敗しました"
      redirect_to edit_user_path(current_user)
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
      redirect_to user_path(current_user)
    else
      @address = AddressName.find(params[:id])
      flash[:notice] = "宛名の編集に失敗しました"
      redirect_to edit_user_path(current_user)
    end
  end

  def destroy
    address_name = AddressName.find(params[:id])
    if address_name.destroy
      flash[:notice] = "宛名を削除しました"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "宛名の削除に失敗しました"
      redirect_to edit_user_path(current_user)
    end
  end


private

  def address_name_params
    params.require(:address_name).permit(:address_name)
  end
end
