class Inquiry < ApplicationRecord

	has_one :inquiry_reply dependent: :destroy

end
