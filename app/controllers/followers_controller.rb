class FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :edit, :update, :destroy]

  # GET /followers
  def index
    @followers = Follower.all
  end

  # GET /followers/1
  def show
  end

  # GET /followers/new
  def new
    @follower = Follower.new
  end

  # GET /followers/1/edit
  def edit
  end

  # POST /followers
  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      redirect_to (request.referer.nil? ? @follower: request.referer)#, notice: 'Follower was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /followers/1
  def update
    if @follower.update(follower_params)
      redirect_to @follower, notice: 'Follower was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /followers/1
  def destroy
    @follower.destroy
    redirect_to (request.referer.nil? ? followers_url : request.referer) #, notice: 'Follower was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follower_params
      params.require(:follower).permit(:user_id, :follower_id)
    end
end
