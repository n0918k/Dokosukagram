class PlacesController < ApplicationController
  before_action :set_place,only: [:show,:edit]

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

  def show
    @items = @place.items.includes(:user)
  end

  private
  def place_params
    params.permit(:name,:image).merge(user_id: current_user.id)
  end

  def set_place
    @place = Place.find(params[:id])
  end

end
