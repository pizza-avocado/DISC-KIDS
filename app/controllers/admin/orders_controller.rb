class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: %i[index show update]

  def index
    @orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	redirect_to admin_order_path(order)
    flash[:notice] = "注文ステータスを[" + order.order_status + "]に変更しました"
  end

private

  def order_params
  params.require(:order).permit(:order_status)
  end


end
