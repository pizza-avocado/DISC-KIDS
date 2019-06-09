class Disc < ApplicationRecord

	has_many :tracks dependent: :destroy

	belongs_to :item

end
