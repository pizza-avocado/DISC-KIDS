class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy, :show]


  def new
      @item = Item.new
      @disc = @item.discs.build
      @track = @disc.tracks.build
  end

  def show
      @item = Item.find(params[:id])
  end

  def index
      @items = Item.all
      @items = Item.page(params[:page]).reverse_order
  end

  def search
      @items = Item.search(params[:search])
      render :search
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "商品名: " + @item.name + "を追加しました"
        redirect_to admin_items_path
      else
        flash[:notice] = "商品追加に失敗しました"
        redirect_to new_admin_item_path
      end
  end

  def edit
      @item = Item.find(params[:id])
  end

  def update
      @item = Item.find(params[:id])
      if params[:item][:stock].to_i == 0
        params[:item][:status] = "Sold out"
      end
      if @item.update(item_params)
         flash[:notice] = "商品名: " + @item.name + "を編集しました"
         redirect_to admin_item_path(@item)
      else
         flash[:notice] = "商品編集に失敗しました"
         redirect_to edit_admin_item_path(@item)
      end
  end

  def destroy
      @item = Item.find(params[:id])
      if @item.destroy
         flash[:notice] = "商品名: " + @item.name + "を削除しました"
         redirect_to admin_items_path
      else
        flash[:notice] = "商品削除に失敗しました"
        redirect_to edit_admin_item_path(@item)
      end
  end

  private
  def item_params
      params.require(:item).permit(:name, :price, :stock, :status, :jacket_image, :artist_id, :label_id, :genre_id,
      discs_attributes: [:id, :disc_id, :disc_number, :_destroy,
      tracks_attributes: [:id, :track_id, :track_number, :track_name, :_destroy]])
  end
end
