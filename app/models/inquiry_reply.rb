class InquiryReply < ApplicationRecord

  belongs_to :admin
  belongs_to :inquiry

  validates :reply_content, presence: true

end
