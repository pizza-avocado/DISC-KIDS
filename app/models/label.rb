# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :label, presence: true
end
