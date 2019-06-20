class Inquiry < ApplicationRecord

	has_one :inquiry_reply, dependent: :destroy

	default_scope -> { order(created_at: :desc)}

end
