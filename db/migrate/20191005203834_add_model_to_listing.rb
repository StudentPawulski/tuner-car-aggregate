# frozen_string_literal: true

class AddModelToListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :model, null: true, foreign_key: true
  end
end
