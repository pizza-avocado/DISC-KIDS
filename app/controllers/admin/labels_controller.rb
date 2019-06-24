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
      @label = Label.new(label_params)
      if @label.save
        flash[:notice] = "レーベル名: " + @label.label + "を追加しました"
        redirect_to new_admin_item_path
      else
        flash[:notice] = "レーベル追加に失敗しました"
        redirect_to new_admin_item_path
      end
  end

  def edit
      @label = Label.find(params[:id])
  end

  def update
      @label = Label.find(params[:id])
      if @label.update(label_params)
          flash[:notice] = "レーベル名: " + @label.label + "に編集しました"
          redirect_to new_admin_item_path
      else
          flash[:notice] = "レーベル編集に失敗しました"
          redirect_to edit_admin_label_path
      end
  end

  def destroy; end

  private
  def label_params
      params.require(:label).permit(:label)
  end
end
