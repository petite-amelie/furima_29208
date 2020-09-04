class OrdersController < ApplicationController
  before_action :can_not_direct_order, only: [:index]
  before_action :deja_order, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDestination.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.require(:order_destination).permit(:token, :post_code, :prefecture_id, :city, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_ebf25104faa2bdc8cd12198e"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def can_not_direct_order
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def deja_order
    @order = Order.select('item_id')
    if request.referer == nil && Item.find(params[:item_id]).order != nil
      redirect_to root_path
    end
  end

end
