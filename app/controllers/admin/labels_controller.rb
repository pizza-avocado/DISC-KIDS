class Admin::LabelsController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :create, :index, :edit, :update, :destroy]

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
    redirect_to new_admin_item_path
  end

  def edit
  end

  def update
  end

  def destroy
  end




  private

  def label_params
    params.require(:label).permit(:label)
  end



end