# frozen_string_literal: true

class Admin::LabelsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create index edit update destroy]

  def index
      @labels = Label.all
  end

  def new
      @label = Label.new
      @labels = Label.all
  end

  def create
      label = Label.new(label_params)
      label.save
      redirect_to admin_item_path
  end

  def edit
      @label = Label.find(params[:id])
  end

  def update
      label = Label.find(params[:id])
      label.update(label_params)
      redirect_to new_admin_artist_path
  end

  def destroy; end

  private
  def label_params
      params.require(:label).permit(:label)
  end
end
