#---
# Excerpted from "Hotwire Native for Rails Developers",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/jmnative for more book information.
#---
class HikesController < ApplicationController
  before_action :authenticate_user!, except: %w[index show]

  def index
    @hikes = Hike.order(created_at: :desc)
  end

  def show
    @hike = Hike.find(params[:id])
    @like = @hike.likes.find_by(user: current_user)
  end

  def new
    @hike = Hike.new
  end

  def edit
    @hike = current_user.hikes.find(params[:id])
  end

  def create
    @hike = Hike.new(hike_params)
    if @hike.save
      redirect_to @hike, notice: "Hike added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @hike = current_user.hikes.find(params[:id])
    if @hike.update(hike_params)
      redirect_to @hike, notice: "Hike updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.hikes.find(params[:id]).destroy
    redirect_to hikes_path, notice: "Hike deleted."
  end

  private

  def hike_params
    params
      .require(:hike)
      .permit(:name, :description, :image, :latitude, :longitude)
      .merge(user: current_user)
  end
end
