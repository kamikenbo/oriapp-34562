require 'rails_helper'
RSpec.describe TweetsController, type: :request do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do
      get root_path
      expect(response.body).to include('投稿を検索する')
    end
  end
  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get tweets_path(@tweet)
      expect(response.status).to eq 200
    end
  end
end
