# frozen_string_literal: true

class AddLocationToListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :province, null: true, foreign_key: true
  end
end
