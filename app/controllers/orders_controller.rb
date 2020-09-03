class OrdersController < ApplicationController
  
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

end
