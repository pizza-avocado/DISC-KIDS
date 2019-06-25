# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :disc
  validates :track_number, presence: true
  validates :track_name, presence: true
end
