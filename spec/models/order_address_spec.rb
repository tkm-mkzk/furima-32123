require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品購入できる時' do

      it "token、postal_code、prefecture、city、addresses、building_name、phone_numberが存在すれば購入できること" do
        expect(@order_address).to be_valid
      end

      it "building_nameが空でも購入できること" do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end

    end

    context '商品購入できない時' do

      it "tokenが空では購入できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では購入できないこと" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeはハイフンがないと購入できないこと" do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefectureが空では購入できないこと" do
        @order_address.prefecture = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefectureが1では購入できないこと" do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では購入できないこと" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "addressesが空では購入できないこと" do
        @order_address.addresses = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end

      it "phone_numberが空では購入できないこと" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは11桁以下でないと購入できないこと" do
        @order_address.phone_number = "090111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. No more than 11 digits and no hyphen(-)")
      end

      it "phone_numberは数字のみでないと（ハイフンが含まれていると）購入できないこと" do
        @order_address.phone_number = "090-1111-1111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. No more than 11 digits and no hyphen(-)")
      end

    end
  end
end
