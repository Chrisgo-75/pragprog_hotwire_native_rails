#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class HikeLike < ApplicationRecord
  belongs_to :hike, counter_cache: :likes_count
  belongs_to :user

  validates :user, uniqueness: {scope: :hike}
end
