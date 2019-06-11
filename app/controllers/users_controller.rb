class UsersController < ApplicationController

  before_action :authenticate_user!,  only: [:show, :edit, :update, :resign, :destroy]

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

end
