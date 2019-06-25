class Disc < ApplicationRecord

	has_many :tracks, dependent: :destroy
	accepts_nested_attributes_for :tracks, allow_destroy: true

	belongs_to :item
	validates :disc_number, presence: true

end
