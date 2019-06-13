class Admin::ArtistsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :index, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    @artists = Artist.all
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to new_admin_item_path
  end

  def edit
  end

  def update
  end

  def destroy
  end




  private

  def artist_params
    params.require(:artist).permit(:artist)
  end

end
