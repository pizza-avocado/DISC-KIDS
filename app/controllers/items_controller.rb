class ItemsController < ApplicationController


  def index
  	if cookies[:key].word.blank?
      @items = Item.page(params[:page]).reverse_order
  	end
  end

def search
	
    @items = Item.search(params[:search])
    render :search
  end

  def show
  end


end
