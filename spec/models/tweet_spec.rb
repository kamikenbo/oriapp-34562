require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'content,category_id,condition_id,baby_age_id,baby_gender_idがあれば投稿できる' do
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
        expect(@tweet.errors.full_messages).to include('Contentを入力してください')
      end
      it 'category_idが空では投稿できない' do
        @tweet.category_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Categoryを入力してください')
      end
      it 'category_idのidが1では登録できない' do
        @tweet.category_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Categoryは1以外の値にしてください')
      end
      it 'condition_idが空では投稿できない' do
        @tweet.condition_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Conditionを入力してください')
      end
      it 'condition_idのidが1では登録できない' do
        @tweet.condition_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Conditionは1以外の値にしてください')
      end
      it 'baby_age_idが空では投稿できない' do
        @tweet.baby_age_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby ageを入力してください')
      end
      it 'baby_age_idのidが1では登録できない' do
        @tweet.baby_age_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby ageは1以外の値にしてください')
      end
      it 'baby_gender_idが空では投稿できない' do
        @tweet.baby_gender_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby genderを入力してください')
      end
      it 'baby_gender_idのidが1では登録できない' do
        @tweet.baby_gender_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Baby genderは1以外の値にしてください')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
