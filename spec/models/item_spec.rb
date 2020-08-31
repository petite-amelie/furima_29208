require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  

  describe '出品機能' do
    it "画像が空では出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空では出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空では出品できない" do
      @item.introduction = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end
    it "カテゴリーが -- では出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態の情報が -- では出品できない" do
      @item.item_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition must be other than 1")
    end
    it "配送料の負担の情報が -- では出品できない" do
      @item.postage_type_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage type must be other than 1")
    end
    it "発送元の地域の情報が -- では出品できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "発送までの日数についての情報が -- では登録できない" do
      @item.preparation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation must be other than 1")
    end
    it "価格が空では出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が¥300未満だと出品できない" do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格が¥9,999,999より大きいとと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end
    it "価格は半角数字でないと出品できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
