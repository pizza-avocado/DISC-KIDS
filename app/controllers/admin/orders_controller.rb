class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!, only: [:index, :show, :update]

  def index
  end

  def show
  end

  def update
  end

end
