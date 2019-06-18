# frozen_string_literal: true

class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create index edit update destroy]

  def index
      @genres = Genre.all
  end

  def new
      @genre = Genre.new
      @genres = Genre.all
  end

  def create
      genre = Genre.new(genre_params)
      genre.save
    if params[:commit] == "add"
      redirect_to new_admin_item_path
    else
      redirect_to edit_admin_item_path(params[:artist][:id])
    end
  end

  def edit
      @genre = Genre.find(params[:id])
  end

  def update; end

  def destroy; end

  private

  def genre_params
    params.require(:genre).permit(:genre)
  end
end
