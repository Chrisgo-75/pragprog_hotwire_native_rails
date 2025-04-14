#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class CreateHikes < ActiveRecord::Migration[7.0]
  def change
    create_table :hikes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :image_credit
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
