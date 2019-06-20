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
      redirect_to new_admin_item_path
  end

  def edit
      @artist = Artist.find(params[:id])
  end

  def update
      artist = Artist.find(params[:id])
      artist.update(artist_params)
      redirect_to new_admin_artist_path
  end

  def destroy; end

  private
  def artist_params
      params.require(:artist).permit(:artist)
  end
end