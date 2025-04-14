#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class User < ApplicationRecord
  has_secure_password

  has_many :hikes
  has_many :hike_likes
  has_many :liked_hikes, through: :hike_likes, source: :hike

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  normalizes :email, with: -> { _1.strip.downcase }
end
