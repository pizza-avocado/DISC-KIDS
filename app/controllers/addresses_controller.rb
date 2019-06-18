class AddressesController < ApplicationController

  before_action :authenticate_user!,  only: [:new, :create, :show, :update, :destroy]

  def new
  end

  def create
    address = Address.new(address_params)
    address.user_id = current_user.id
    if address.save
      redirect_to user_path(current_user)
    end
  end

  def show
    @addresses = Address.all
  end

  def update
    address = address.find(params[:id])
    if address.update
      redirect_to user_path(current_user)
  end
end

  def destroy
  end



private

  def address_params
  params.require(:address).permit(:postalcode, :address)
  end

end
