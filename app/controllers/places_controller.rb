class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :destroy]
  before_action :login

  def index
    @places = Place.where(user_id: current_user.id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.valid?
      @place.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @place.destroy
    redirect_to root_path
  end

  def show
    @items = @place.items.includes(:user)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def place_params
    params.require(:place).permit(:name, :image).merge(user_id: current_user.id)
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
