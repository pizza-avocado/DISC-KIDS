class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @item = Item.new
    # @artist = Artist.new
  end

  def index
    @items = Item.all
    @items = Item.page(params[:page]).reverse_order
  end

  def search
    @items = Item.search(params[:serch])
    render :search
  end


  def create
    item = Item.new(item_params)
    item.save
    redirect_to items_path
  end

  def edit
  end

  def update
  end

  def destoy
  end


private
  def item_params
    params.require(:item).permit(:name, :price, :stock, :status, :artist_id, :label_id, :genre_id)
  end

  # def artist_params
  #   params.require(:artist).permit(:id, :artist,items_attributes: [:name, :price, :stock, :status, :id])
  # end



end
