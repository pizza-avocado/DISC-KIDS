class AddressesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show update destroy]

  def new; end

  def create
    address = Address.new(address_params)
    address.user_id = current_user.id
    if address.save
      redirect_to user_path(current_user)
    end
  end


  def show; end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "送付先を編集しました"
      redirect_to user_path(current_user)
    else
      @address = Address.find(params[:id])
      flash[:notice] = "送付先の編集に失敗しました"
      render :edit
    end
  end


  def destroy
  end



private

  def address_params
  params.require(:address).permit(:postalcode, :address)
  end


end
