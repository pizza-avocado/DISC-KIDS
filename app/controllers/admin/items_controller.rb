class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :show]


  def new
    @item = Item.new
    @disc = @item.discs.build
    @track = @disc.tracks.build
  end

  def show
    @item = Item.find(params[:id])
    @artist = Artist.find(params[:id])
    @label = Label.find(params[:id])
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

  def edit; end

  def update; end

  def destoy; end

  private
  def item_params
    params.require(:item).permit(:name, :price, :stock, :status, :jacket_image, :artist_id, :label_id, :genre_id,
      discs_attributes: [:disc_id, :disc_number, :_destroy,
      tracks_attributes: [:track_id, :track_number, :track_name, :_destroy]])
  end
end
