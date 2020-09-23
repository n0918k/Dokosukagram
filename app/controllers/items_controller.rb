class ItemsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @item = Item.new(item_params)
    ActionCable.server.broadcast 'item_channel', content: @item if @item.save
  end

  private

  def item_params
    params.permit(:name,:place_id).merge(user_id: current_user.id, place_id: params[:place_id])
  end
end
