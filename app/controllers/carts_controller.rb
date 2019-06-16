class CartsController < ApplicationController

  before_action :authenticate_user!,  only: [:create, :index, :destroy]

  def create

  if current_user.carts.any? { |cart| cart.item_id == params[:item_id].to_i }
  	cart = Cart.find_by(item_id: params[:item_id])
  	cart.quantity += 1
  else
  	cart = Cart.new
  	cart.quantity = 1
  end

  	cart.item_id = params[:item_id]
  	cart.user_id = current_user.id
  	cart.save
  	redirect_to carts_path

  end


  def index
  	@carts = current_user.carts
  end

  def update
  	cart = Cart.find_by(item_id: params[:cart][:item_id], user_id: current_user.id)
  	cart.update(quantity: params[:cart][:quantity])
  	redirect_to carts_path
  end

  def destroy
  	cart = Cart.find_by(item_id: params[:cart][:item_id], user_id: current_user.id)
  	cart.destroy
  	redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :user_id, :quantity)
  end



end
