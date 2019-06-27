# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
  	# if cookies[:key].word.blank?
  	@items = Item.all
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
    # binding.pry
    @item = Item.find(params[:id])

  end
end

private
  def item_params
    params.require(:item).permit(:name, :disctype, :price, :stock, :status, :jacket_image_id, :artist_id, :label_id, :genre_id)
  end