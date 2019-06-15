# frozen_string_literal: true

class Admin::AddressesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show update destroy]

  def new; end

  def create; end

  def show; end

  def update; end

  def destroy; end
end
