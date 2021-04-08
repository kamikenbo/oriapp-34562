class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

def index
  @tweets = Tweet.includes(:user).order("created_at DESC")
  @search_params = tweet_search_params  
  @tweet = Tweet.search(@search_params).includes(:user)  
end

def new
  @tweet = Tweet.new
end

def create
  @tweet = Tweet.new(tweet_params)
  if @tweet.save
    redirect_to root_path 
  else
    render :new
  end
end

def destroy
  @tweet = Tweet.find(params[:id])
  tweet = Tweet.find(params[:id]) 
  tweet.destroy
end

def edit
  @tweet = Tweet.find(params[:id])
end

def update
  tweet = Tweet.find(params[:id])
  tweet.update(tweet_params)
end

def show
  @tweet = Tweet.find(params[:id])
  @comment = Comment.new
  @comments = @tweet.comments.includes(:user)
end

def search
  @search_params = tweet_search_params  
  @tweets = Tweet.search(@search_params) 
end

private
  def tweet_params
    params.require(:tweet).permit(:content,:image,:category_id,:condition_id,:baby_age_id,:baby_gender_id,:video).merge(user_id: current_user.id)
  end

  def tweet_search_params
     params.fetch(:search, {}).permit(:content, :category_id, :condition_id, :baby_age_id, :baby_gender_id)
  end
end
