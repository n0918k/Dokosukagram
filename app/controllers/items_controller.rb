class ItemsController < ApplicationController
  before_action :login
  def create
    @place = Place.find(params[:place_id])
    @item = Item.new(item_params)
    ActionCable.server.broadcast 'item_channel', content: @item if @item.save
  end

  def show
    @item = Item.find(params[:place_id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.permit(:name, :image, :place_id).merge(user_id: current_user.id, place_id: params[:place_id])
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end


end
