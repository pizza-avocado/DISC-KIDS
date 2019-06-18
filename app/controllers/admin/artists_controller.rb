# frozen_string_literal: true

class Admin::ArtistsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create index edit update destroy]

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
    if params[:commit] == "add"
      redirect_to new_admin_item_path
    else
       redirect_to edit_admin_item_path(params[:artist][:id])
    end
  end

  def edit
      @artist = Artist.find(params[:id])
  end

  def update; end

  def destroy; end

  private

  def artist_params
      params.require(:artist).permit(:artist)
  end
end
