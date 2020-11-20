class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_details
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_days
  belongs_to :user
  has_one_attached :image
  has_one :order

  #空の投稿を保存できないようにする
  with_options presence: true do
  validates :name
  validates :description
  validates :price
  validates :image
  end

  validates :price, format: { with: /\d/ }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id 
  validates :product_details_id
  validates :delivery_fee_id
  validates :shipping_area_id
  validates :shipping_days_id
end
end
