class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_details
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_days
  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  validates :price, format: { with: /\d/ }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :product_details_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }
  
end
