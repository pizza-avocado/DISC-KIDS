# frozen_string_literal: true

class AddressName < ApplicationRecord
  belongs_to :user

  validates :address_name,     presence: true
end
