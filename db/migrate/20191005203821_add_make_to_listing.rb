# frozen_string_literal: true

class AddMakeToListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :make, null: true, foreign_key: true
  end
end
