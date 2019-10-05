# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :makes
  belongs_to :models
  belongs_to :provinces

  validates :makes, :models, :url, presence: true
end
