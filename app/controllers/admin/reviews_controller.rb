# frozen_string_literal: true

class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create edit update destroy]

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
