class Artist < ApplicationRecord

	has_many :items, dependent: :destroy
	accepts_nested_attributes_for :items

	default_scope -> { order(artist: :asc)}

end
