class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:create,:index]

  def index
    return redirect_to root_path if current_user.id == set_item.user_id || set_item.order !=nil
    @order = PurchaseFunction.new
  end

  def create
    @order = PurchaseFunction.new(order_params)
    if  @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:purchase_function).permit(:postal_code,:municipalities, :address, :building, :phone_number,:shipping_area_id).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end
