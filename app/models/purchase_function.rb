class PurchaseFunction
  include ActiveModel::Model
  attr_accessor :postal_code,:municipalities, :address, :building, :phone_number, :buy_item, :user_id, :item_id,:shipping_area_id,:token
  #belongs_to :order
  #has_one    :shipping_address

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :municipalities
    validates :address
    validates :phone_number
    validates :token
    validates :shipping_area_id
    end
  
  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
    end
    
  validates :phone_number,    length: { maximum: 11 }
  validates :phone_number,    numericality: {message: 'Input only number'}

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/} do
    validates :postal_code
  end
  
  def save
    # 各テーブルにデータを保存する処理を書く
    order=Order.create(user_id: user_id, item_id: item_id)
    addres=ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building: building,phone_number: phone_number,order: order)
  end
end