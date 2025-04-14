#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?
  end

  def sign_in(user)
    Current.user = user
    cookies.encrypted[:user_id] = user.id
  end

  def sign_out(user)
    Current.user = nil
    reset_session
    cookies.delete(:user_id)
  end

  def authenticate_user!
    if current_user.blank?
      redirect_to new_session_path,
        notice: "You need to sign in to continue."
    end
  end

  private

  def current_user
    Current.user ||= authenticate_user_from_session
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user_from_session
    User.find_by(id: cookies.encrypted[:user_id])
  end
end
