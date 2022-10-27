require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  before do
    @purchase_record_destination = FactoryBot.build(:purchase_record_destination)
  end

  describe '商品の購入' do
    context '商品を購入できる時' do
      it 'user_id、item_id、post_code、prefecture_id、city、adress、phone_number、tokenが存在すれば登録できる' do
        expect(@purchase_record_destination).to be_valid
      end
    end

    context '配送を購入できない時' do
      it 'user_idが紐づいていないと保存できない' do
        @purchase_record_destination.user_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと保存できない' do
        @purchase_record_destination.item_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では登録できない' do
        @purchase_record_destination.post_code = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角文字列以外では登録できない' do
        @purchase_record_destination.post_code = '７９１ー０２４５'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include('Post code must be single-byte numbers, including hyphens')
      end
      it 'post_codeが「7桁ハイフンなし」の半角文字列では登録できない' do
        @purchase_record_destination.post_code = '7910245'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include('Post code must be single-byte numbers, including hyphens')
      end
      it 'prefecture_idが空では登録できない' do
        @purchase_record_destination.prefecture_id = '1'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase_record_destination.city = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @purchase_record_destination.address = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @purchase_record_destination.phone_number = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角数値以外では登録できない' do
        @purchase_record_destination.phone_number = '０９０１２３４５６７８'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include('Phone number must be at least 10 and no more than 11 single-byte digits')
      end
      it 'phone_numberは9桁以下では登録できない' do
        @purchase_record_destination.phone_number = '090123456'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include('Phone number must be at least 10 and no more than 11 single-byte digits')
      end
      it 'phone_numberは12桁以上では登録できない' do
        @purchase_record_destination.phone_number = '090123456789'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include('Phone number must be at least 10 and no more than 11 single-byte digits')
      end
      it 'tokenが空では登録できない' do
        @purchase_record_destination.token = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
