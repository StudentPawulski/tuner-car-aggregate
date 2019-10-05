# frozen_string_literal: true

class AddMakeToModel < ActiveRecord::Migration[6.0]
  def change
    add_reference :models, :make, null: true, foreign_key: true
  end
end
