class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end