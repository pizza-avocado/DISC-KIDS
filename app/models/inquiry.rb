class Inquiry < ApplicationRecord

  has_one :inquiry_reply, dependent: :destroy

  validates :email, presence: true
  validates :inquiry_content, presence: true

  default_scope -> { order(created_at: :desc)}

end
