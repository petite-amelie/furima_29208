require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  
  before do
    @od = FactoryBot.build(:order_destination)
  end


  describe '購入機能' do
    it '郵便番号が空だと購入できない' do
      @od.post_code = ""
      @od.valid?
      expect(@od.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にはハイフンがないと購入できない' do
      @od.post_code = "1234567"
      @od.valid?
      expect(@od.errors.full_messages).to include("Post code is invalid")
    end
    it '都道府県が -- だと購入できない' do
      @od.prefecture_id = 1
      @od.valid?
      expect(@od.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '市区町村が空だと購入できない' do
      @od.city = ""
      @od.valid?
      expect(@od.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できない' do
      @od.house_number = ""
      @od.valid?
      expect(@od.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと購入できない' do
      @od.phone_number = ""
      @od.valid?
      expect(@od.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると購入できない' do
      @od.phone_number = "090-1234-5678"
      @od.valid?
      expect(@od.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁だと購入できない' do
      @od.phone_number = "012345678912"
      @od.valid?
      expect(@od.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが空だと購入できない' do
      @od.token = ""
      @od.valid?
      expect(@od.errors.full_messages).to include("Token can't be blank")
    end
    it '全て値が正しく存在すれば登録できる' do
      expect(@od).to be_valid
    end
  end

end