class Admin::InquiriesController < ApplicationController
  before_action :authenticate_admin!, only: [:index]

  def index
  	@inquiries = Inquiry.all
  	@inquiry_replies = InquiryReply.all
  end

  def show
  	@inquiry = Inquiry.find(params[:id])
  	@inquiry_reply = InquiryReply.new
  end

  def new
  end

  def create
  end

end
