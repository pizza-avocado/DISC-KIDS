class Item < ApplicationRecord

  has_many :discs, 		 dependent: :destroy
  accepts_nested_attributes_for :discs, allow_destroy: true
  has_many :carts, 		 dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :reviews, 	 dependent: :destroy
  has_many :likes, 		 dependent: :destroy

  belongs_to :genre
  belongs_to :label
  belongs_to :artist
  attachment :jacket_image

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :status, presence: true

def self.search(search)
	if search.present?
		Item.joins(:artist).where(['name LIKE? OR artist LIKE?', "%#{search}%","%#{search}%"])
	else
		Item.all
	end
end


def liked_by?(user)
	likes.where(user_id: user.id).exists?
end


end
