class Admin::InquiryRepliesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create show ]

  def new; end

  def create
  	inquiry_reply = InquiryReply.new(inquiry_reply_params)
  	inquiry_reply.admin_id = current_admin.id
  	inquiry_reply.save
  	redirect_to admin_inquiry_path(inquiry_reply.inquiry_id)
  	flash[:success] = "返信を登録しました"
  end

  def show; end

  private
  def inquiry_reply_params
    params.require(:inquiry_reply).permit(:reply_content, :inquiry_id, :administrator_id)
  end

end
