# frozen_string_literal: true

class Model < ApplicationRecord
  belong_to :make
  has_many :listings
end
