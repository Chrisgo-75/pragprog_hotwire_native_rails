#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
Rails.application.routes.draw do
  root "hikes#index"

  resource :session, only: %i[new create destroy]

  resources :hikes do
    resource :map, only: :show
    resources :likes, only: %w[create destroy]
  end

  resources :users, only: :index do
    resources :hikes, only: :index, controller: :user_hikes
  end

  resources :configurations, only: [] do
    get :ios_v1, on: :collection
    get :android_v1, on: :collection
  end

  namespace :hotwire do
    namespace :android do
      resource :configurations, only: [] do
        get :v1
      end
    end # END namespace :android do
    namespace :ios do
      namespace :configurations, only: [] do
        get :v1
      end
    end # END namespace :ios do
  end # END namespace :hotwire do

end
