# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create index show]

  def new
  	@order = Order.new
  	@carts = current_user.carts
  end

  def create
  	# order create
  	order = Order.new(order_params)
  	order.user_id = current_user.id
  	order.order_status = "注文受付済"
  	order.save

  	# order item create
  	current_user.carts.each do |cart|
  	  order_item = OrderItem.new
      order_item.item_id = cart.item_id
  	  order_item.order_id = order.id
      order_item.quantity = cart.quantity
      order_item.purchaced_price = cart.item.price
  	  order_item.save
  	end

  	# cart delete
  	current_user.carts.each do |cart|
  	cart.destroy

  	end

    redirect_to orders_path
    flash[:success] = "購入が確定されました！"
  end

  def index
  	@orders = current_user.orders
    @orders_page = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
  end



  private

  def order_params
    params.require(:order).permit(:user_id, :payment, :address_name, :shipping_address, :order_status)
  end



end
