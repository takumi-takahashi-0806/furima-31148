class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :name
      t.text       :description
      t.integer    :category_id
      t.integer    :product_details_id
      t.integer    :delivery_fee_id
      t.integer    :shipping_area_id
      t.integer    :shipping_days_id
      t.integer    :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
