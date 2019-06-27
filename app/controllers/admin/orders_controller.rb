
class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: %i[index show update]

  def index
    if 
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	redirect_to admin_order_path(order)
  end

private

  def order_params
  params.require(:order).permit(:order_status)
  end
end
