# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  validates :address,    presence: true

end
