# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
  	item = Item.find(params[:item_id])
  	like = current_user.likes.new(item_id: item.id)
  	like.save
  	redirect_to item_path(item)
  end

  def destroy
  	item = Item.find(params[:item_id])
  	like = current_user.likes.find_by(item_id: item.id)
  	like.destroy
  	redirect_to item_path(item)
  end
end
