require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'content,image,video,category_id,condition_id,baby_age_id,baby_gender_idがあれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'image,videoが空でも投稿できる' do
        @tweet.image = nil
        @tweet.video = nil
        @tweet.valid?
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'contentが空では投稿できない' do
        @tweet.content = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では投稿できない' do
        @tweet.category_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idのidが1では登録できない' do
        @tweet.category_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが空では投稿できない' do
        @tweet.condition_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Condition is not a number')
      end
      it 'condition_idのidが1では登録できない' do
        @tweet.condition_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'baby_age_idが空では投稿できない' do
        @tweet.baby_age_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby age is not a number')
      end
      it 'baby_age_idのidが1では登録できない' do
        @tweet.baby_age_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby age must be other than 1')
      end
      it 'baby_gender_idが空では投稿できない' do
        @tweet.baby_gender_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby gender is not a number')
      end
      it 'baby_gender_idのidが1では登録できない' do
        @tweet.baby_gender_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby gender must be other than 1')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
