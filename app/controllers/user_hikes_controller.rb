#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class UserHikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @hikes = @user.hikes.order(created_at: :desc)
  end
end
