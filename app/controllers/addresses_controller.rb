class AddressesController < ApplicationController

  before_action :authenticate_user!,  only: [:new, :create, :show, :update, :destroy]

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
