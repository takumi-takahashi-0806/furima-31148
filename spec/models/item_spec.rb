require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'item出品登録' do
    context '全部の条件が一致していれば登録できる' do
      it "存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが「--」だと登録できない" do
        @item.category_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "product_details_idが「--」だと登録できない" do
        @item.product_details_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product details is not a number")
      end
      it "delivery_fee_idが「--」だと登録できない" do
        @item.delivery_fee_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it "shipping_area_idが「--」だと登録できない" do
        @item.shipping_area_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it "shipping_days_idが「--」だと登録できない" do
        @item.shipping_days_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days is not a number")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字出ないと登録できない" do
        @item.price = "３３９９"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが333円〜9,999,999円でないと登録できない" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "写真一枚ないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end

