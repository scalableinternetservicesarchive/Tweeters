class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @tweet = Tweet.find_by(id: @comment.tweet_id)   

    if !@tweet.nil?
      @tweet.comments+=1
      @tweet.save
    end

    if @comment.save
      redirect_to (@tweet.nil?)?(@comment):(@tweet), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @tweet = Tweet.find_by(id: @comment.tweet_id)
    @comment.destroy
    if !@tweet.nil?
      @tweet.comments-=1
      @tweet.save
    end
    redirect_to (@tweet.nil?)?(comments_url):(@tweet), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :tweet_id, :content)
    end
end
