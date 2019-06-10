class UsersController < ApplicationController

  before_action :authenticate_user!,  only: [:show, :edit, :update, :resign, :destroy]
  before_action :authenticate_admin!, only: [:show, :edit, :update, :destroy, :index]


  def show
  end

  def edit
  end

  def update
  end

  def resign
  end

  def destroy
  end

  def index
  end
end
