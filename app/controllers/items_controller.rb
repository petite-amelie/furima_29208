class ItemsController < ApplicationController
  before_action :to_top_page, only: [:new]
  before_action :authenticate_user! , except: [:index, :show]
  before_action :item_parameter, only: [:show, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(
      :item
    ).permit(
      :name, :price, :introduction, :category_id, :image,
      :item_condition_id, :prefecture_id, :postage_type_id, :preparation_id
    ).merge(
      user_id: current_user.id
    )
  end
  
  def to_top_page
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_parameter
    @item = Item.find(params[:id])
  end
end
