class InquiriesController < ApplicationController

  before_action :authenticate_admin!, only: [:index]

  def index
  end

  def new
  end

  def create
  end
end
