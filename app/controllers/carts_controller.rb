class CartsController < ApplicationController

  before_action :authenticate_user!,  only: [:create, :index, :destroy]

  def create
  end

  def index
  end

  def destroy
  end
end
