class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!, only: [:index, :show, :update]


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
