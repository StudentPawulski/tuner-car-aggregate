class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :make
      t.string :model
      t.string :url
      t.float :price
      t.text :description
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end
end
