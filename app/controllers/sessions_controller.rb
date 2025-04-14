#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class SessionsController < ApplicationController
  def create
    if (user = User.authenticate_by(authentication_params))
      sign_in user
      redirect_to hikes_path, notice: "You are now signed in."
    else
      render :new,
        status: :unprocessable_entity,
        alert: "Invalid email or password."
    end
  end

  def destroy
    sign_out current_user
    redirect_to hikes_path, notice: "You are no longer signed in."
  end

  private

  def authentication_params
    {email: params[:email], password: params[:password]}
  end
end
