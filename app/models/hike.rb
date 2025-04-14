#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class Hike < ApplicationRecord
  validates :name, :description, presence: true

  belongs_to :user, counter_cache: true

  has_many :likes, class_name: "HikeLike"
  has_many :likers, through: :likes, source: :user

  has_one_attached :image
end
