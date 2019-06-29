class Admin::InquiriesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]

  def index
  	@inquiries = Inquiry.all
  	@inquiry_replies = InquiryReply.all
  	@inquiries = Inquiry.page(params[:page]).reverse_order
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
