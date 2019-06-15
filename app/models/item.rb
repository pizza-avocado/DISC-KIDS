class Item < ApplicationRecord

	has_many :discs, dependent: :destroy
	has_many :carts, dependent: :destroy
	has_many :order_items, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :likes, dependent: :destroy

	belongs_to :genre
	belongs_to :label
	belongs_to :artist


def self.search(search)
	if search.present?
		Item.where(['name LIKE?',"%#{search}%"])
	else
		Item.all
=======
	
	end


end
end
