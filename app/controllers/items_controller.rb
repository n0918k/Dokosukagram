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
    if user_signed_in? && item.user_id == current_user.id
      item.destroy
      redirect_to place_path(item.place.id)
    else
      render new_user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if user_signed_in? && @item.user_id == current_user.id && @item.valid?
      @item.update(item_update)
      redirect_to place_item_path(@item.id)
    else
      render place_items_path(@item.id)
    end
  end

  private

  def item_params
    params.permit(:name, :image, :place_id, :store).merge(user_id: current_user.id, place_id: params[:place_id])
  end

  def item_update
    params.require(:item).permit(:name, :image, :store)
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
