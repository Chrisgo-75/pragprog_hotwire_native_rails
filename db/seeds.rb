#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
def attach_to_hike(filename, hike:)
  filename = "#{filename}.jpg"
  file = File.open(Rails.root.join(*%w[db seeds hikes images], filename))
  hike.image.attach(io: file, filename: filename, content_type: "image/jpg")
end

user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.name = "Meriwether Lewis"
  user.password = "password"
end

friend = User.find_or_create_by!(email: "friend@example.com") do |user|
  user.name = "William Clark"
  user.password = "password"
end

Hike.find_or_create_by!(name: "Crystal Springs") do |hike|
  hike.description = "Just took a leisurely stroll through Crystal Springs, and it's a gem. The rhododendrons were in full bloom, and the ponds were filled with ducks. It's a peaceful oasis right in the city."
  hike.latitude = 45.479588
  hike.longitude = -122.635317
  hike.user = friend

  attach_to_hike("crystal-springs", hike:)
  hike.image_credit = "This Northwest Life"
end

Hike.find_or_create_by!(name: "Mount Tabor") do |hike|
  hike.description = "A volcanic cinder cone offering panoramic views of the city. It's not exactly a strenuous hike, but the uphill climb to the summit is rewarding, especially during sunset. Perfect for an entry about appreciating urban nature."
  hike.latitude = 45.511881
  hike.longitude = -122.595706
  hike.user = user

  attach_to_hike("mount-tabor", hike:)
  hike.image_credit = "Travel Portland"
end

forest_park = Hike.find_or_create_by!(name: "Forest Park") do |hike|
  hike.description = "Just wrapped up a hike in Forest Park, and it was amazing. Even though it's so close to downtown, the towering trees and serene trails made me feel miles away from the city. It's a must-visit for anyone craving a nature break."
  hike.latitude = 45.539327
  hike.longitude = -122.725408
  hike.user = user

  attach_to_hike("forest-park", hike:)
  hike.image_credit = "Portland.gov"
end

forest_park.likes.find_or_create_by(user: friend)
