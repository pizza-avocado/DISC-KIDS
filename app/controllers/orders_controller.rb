class OrdersController < ApplicationController

  before_action :authenticate_user!,  only: [:new, :create, :index, :show]

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def update
  end
end
