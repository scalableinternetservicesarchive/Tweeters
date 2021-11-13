class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  def index
    @likes = Like.all
  end

  # GET /likes/1
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  def create
    @likes = Like.all
    @like = Like.new(like_params)

    # @likes.each do |temp_like|
    #   if temp_like.tweet_id == @like.tweet_id && temp_like.user_id == @like.user_id
    #     redirect_to tweets_url
    #     return
    #   end
    # end

    @tweet = Tweet.where(id: @like.tweet_id).first    
    if !@tweet.nil?
      @tweet.likes = @tweet.likes + 1
      @tweet.save
    end
    if @like.save
      redirect_to tweets_url
    else
      render :new
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      redirect_to tweets_url
    else
      render :edit
    end
  end

  # DELETE /likes/1
  def destroy
    @tweet = Tweet.where(id: @like.tweet_id).first
    if !@tweet.nil?
      @tweet.likes-=1
      @tweet.save
    end
    @like.destroy
    redirect_to tweets_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:user_id, :tweet_id)
    end
end
