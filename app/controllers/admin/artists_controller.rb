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
      @artist = Artist.new(artist_params)
      if @artist.save
        flash[:notice] = "アーティスト名: " + @artist.artist + "を追加しました"
        redirect_to new_admin_item_path
      else
        flash[:notice] = "アーティスト追加に失敗しました"
        redirect_to new_admin_artist_path
      end
  end

  def edit
      @artist = Artist.find(params[:id])
  end

  def update
      @artist = Artist.find(params[:id])
      if @artist.update(artist_params)
        flash[:notice] = "アーティスト名: " + @artist.artist + "に編集しました"
        redirect_to new_admin_item_path
      else
        flash[:notice] = "アーティスト編集に失敗しました"
        redirect_to edit_admin_artist_path
      end
  end

  def destroy
      artist = Artist.find(params[:id])
      artist.destroy
      redirect_to new_admin_artist_path
  end

  private
  def artist_params
      params.require(:artist).permit(:artist)
  end
end