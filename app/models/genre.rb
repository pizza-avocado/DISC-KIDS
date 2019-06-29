# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :genre, presence: true
end
