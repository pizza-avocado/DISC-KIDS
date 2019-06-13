class ItemsController < ApplicationController


  def index
      @items = Item.page(params[:page]).reverse_order
  end

  def show
  end

  def search
    @items= Items.search(params[:search])
  end


end
