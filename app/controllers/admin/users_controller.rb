class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :index]


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end
end