class InquiriesController < ApplicationController
  def new
   @inquiry = Inquiry.new
  end

  def create
   inquiry = Inquiry.new(inquiry_params)
   if inquiry.save
   	redirect_to new_inquiry_path
    flash[:notice] = "お問い合わせを送信しました"
   else
   	redirect_to new_inquiry_path
    flash[:notice] = "空欄があります"
   end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:inquiry_content, :email)
  end


end
