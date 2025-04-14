#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    hike = Hike.find(params[:hike_id])
    hike.likes.find_or_create_by!(user: current_user)
    redirect_to hike
  end

  def destroy
    hike = Hike.find(params[:hike_id])
    hike.likes.find_by(user: current_user)&.destroy!
    redirect_to hike
  end
end
