class ItemsController < ApplicationController


  def index
  end

  def show
  end

  def search
    @items= Items.search(params[:search])
  end


end
