class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code
      t.integer    :shipping_area_id
      t.string     :municipalities
      t.string     :address
      t.string     :building
      t.string     :phone_number
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
