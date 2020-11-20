require 'rails_helper'

describe PurchaseFunction do
  before do
    @purchase_function = FactoryBot.build(:purchase_function)
  end

  describe '購入機能' do
    context '全部の条件が一致していれば購入できる' do
      it "存在すれば登録できる" do
        expect(@purchase_function).to be_valid
      end
    end

    context '購入登録がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @purchase_function.postal_code = ""
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンが存在しないと登録できない" do
        @purchase_function.postal_code = "1234567"
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Postal code is invalid")
      end
      it "shipping_area_idが「--」だと登録できない" do
        @purchase_function.shipping_area_id = 1
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "municipalitiesが空だと登録できない" do
        @purchase_function.municipalities = ""
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "addressが空だと登録できない" do
        @purchase_function.address = ""
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Address can't be blank")
      end
      it "buildingが空だと登録できない" do
        @purchase_function.building = ""
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Building can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @purchase_function.phone_number = ""
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが11桁以上だと登録できない" do
        @purchase_function.phone_number = "0901111111111"
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "phone_numberハイフンが入ってると登録できない" do
        @purchase_function.phone_number = "090-1234-124"
        @purchase_function.valid?
        # binding.pry
        expect(@purchase_function.errors.full_messages).to include("Phone number Input only number")
      end
      it "トークンが存在しないと登録出来ない" do
        @purchase_function.token = ""
        @purchase_function.valid?
        expect(@purchase_function.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


