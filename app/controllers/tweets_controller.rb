class TweetsController < ApplicationController
def index
  @tweets = Tweet.all
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

private
  def tweet_params
    params.require(:tweet).permit(:content,:image,:category_id,:condition_id,:baby_age_id,:baby_gender_id).merge(user_id: current_user.id)
  end

end
