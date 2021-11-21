class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /tweets
  def index
    # @tweets = Tweet.all
    # @tweets = Tweet.paginate(:page => params[:page], :per_page => 4)
    @tweets = Tweet.paginate(:page => params[:page]).order('id DESC')
  end

  # GET /tweets/1
  def show
    @comments = Comment.all
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.build
  end

  # GET /tweets/1/edit
  def edit

  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  # To limit modification access only to tweet owners
  def correct_user
    @tweet = current_user.tweets.find_by(id: params[:id])
    redirect_to tweets_path, notice: "You're not authorized to modify this tweet!" if @tweet.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :likes, :comments, :users_id)
    end
end
