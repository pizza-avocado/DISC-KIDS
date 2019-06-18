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
    if params[:commit] == "add"
      redirect_to new_admin_item_path
    else
       redirect_to edit_admin_item_path(params[:artist][:id])
    end
  end

  def edit
      @lebel = Lebel.find(params[:id])
  end

  def update; end

  def destroy; end

  private

  def label_params
    params.require(:label).permit(:label)
  end
end
