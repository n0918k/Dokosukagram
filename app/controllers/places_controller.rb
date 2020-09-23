class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if  @place.valid?
        @place.save
        redirect_to root_path
    else
        render 'new'
    end
  end

  private
  def place_params
    params.permit(:name,:image).merge(user_id: current_user.id)
  end
end
