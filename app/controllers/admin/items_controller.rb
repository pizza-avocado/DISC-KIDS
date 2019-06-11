class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]


  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destoy
  end
end
