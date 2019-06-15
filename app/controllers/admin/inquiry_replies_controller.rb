class Admin::InquiryRepliesController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :show]

  def new
  end

  def create
  end

  def show
  end

end
