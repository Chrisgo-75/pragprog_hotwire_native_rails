#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
module MapsHelper
  def map_embed_url(latitude, longitude)
    base_url = "https://www.openstreetmap.org/export/embed.html"

    bounding_box = encode([
      longitude - 0.01,
      latitude - 0.01,
      longitude + 0.01,
      latitude + 0.01
    ])

    marker = encode([latitude, longitude])

    "#{base_url}?bbox=#{bounding_box}&layer=mapnik&marker=#{marker}"
  end

  private

  def encode(values)
    values.map { ERB::Util.url_encode(_1.to_s) }.join(",")
  end
end
