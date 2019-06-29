class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def search
    @items = Item.search(params[:search])
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end


private
  def item_params
    params.require(:item).permit(:name, :disctype, :price, :stock, :status, :jacket_image_id, :artist_id, :label_id, :genre_id)
  end


end