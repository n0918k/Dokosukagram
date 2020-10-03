require 'rails_helper'

RSpec.describe Place, type: :model do
  before do
    @place = FactoryBot.build(:place)
    @place.image = fixture_file_upload('spec/fixtures/test_image.png')
  end

  describe '場所の登録' do
    context '場所の登録ができるとき' do
      it '場所の名前と画像があれば登録できる' do
        expect(@place).to be_valid
      end
    end

    context '場所の登録ができないとき' do
      it '場所の名前がなかったら登録できない' do
        @place.name = nil
        @place.valid?
        expect(@place.errors.full_messages).to include('場所の名前を入力してください')
      end

      it '画像がなければ登録できない' do
        @place.image = nil
        @place.valid?
        expect(@place.errors.full_messages).to include('画像を入力してください')
      end
    end
  end
end
