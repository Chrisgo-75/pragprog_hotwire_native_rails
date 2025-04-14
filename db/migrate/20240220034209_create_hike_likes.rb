#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class CreateHikeLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :hike_likes do |t|
      t.belongs_to :hike
      t.belongs_to :user

      t.timestamps null: false
    end

    add_index :hike_likes, [:user_id, :hike_id], unique: true

    add_column :hikes, :likes_count, :integer, default: 0, null: false
  end
end
