class Artist < ApplicationRecord

	has_many :items, dependent: :destroy
	accepts_nested_attributes_for :items

	default_scope -> { order(artist: :asc)}

# 	def self.search(search)
# 	if search.present?
# 		Artist.joins(:items)where(['artist LIKE? OR name LIKE? ',"%#{search}%"])
# 		# Artist.where(['artist LIKE?',"%#{search}%"])
# 	else
# 		Artist.all
# 	end
# end

end
