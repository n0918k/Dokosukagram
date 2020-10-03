require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/fixtures/test_image.png')
  end

  describe '商品の登録' do
    context '商品の登録ができるとき' do
      it '全て入力していると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '場所の登録ができないとき' do
      it '商品の名前がなかったら登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Nameを入力してください')
      end

      it '画像がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Imageを入力してください')
      end

      it '在庫が空だと登録できない' do
        @item.store = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Storeを入力してください')
      end

      it '在庫が整数でないと登録できない' do
        @item.store = '-5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Storeは不正な値です')
      end
    end
  end
end
