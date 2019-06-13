class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :create, :index, :edit, :update, :destroy]

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
    redirect_to new_admin_item_path
  end

  def edit
  end

  def update
  end

  def destroy
  end




  private

  def genre_params
    params.require(:genre).permit(:genre)
  end


end
