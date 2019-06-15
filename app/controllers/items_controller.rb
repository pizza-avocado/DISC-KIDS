class ItemsController < ApplicationController

	
  def index
  	# if cookies[:key].word.blank?
  	  @items = Item.all
      @items = Item.page(params[:page]).reverse_order
  	
  end

def search

    @items = Item.search(params[:search])
    render :search
  end

  def show
  	  @item = Item.find(params[:id])
  end

  def search
    @items= Items.search(params[:search])
  end


end
