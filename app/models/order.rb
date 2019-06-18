class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :user

  default_scope -> { order(created_at: :desc)}


end