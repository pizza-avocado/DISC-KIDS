# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, only: %i[show edit update destroy index]

  def index
    @users = User.all
  end

  def search
    @users = User.search(params[:search])
  end

end
