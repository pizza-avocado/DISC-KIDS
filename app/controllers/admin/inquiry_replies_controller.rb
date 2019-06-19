class Admin::InquiryRepliesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show]

  def new; end

  def create; end

  def show; end
end
