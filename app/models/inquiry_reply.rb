# frozen_string_literal: true

class InquiryReply < ApplicationRecord
  belongs_to :admin
  belongs_to :inquiry
end
