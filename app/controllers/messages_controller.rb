class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:conversation,:edit, :update]
  helper :all

  # GET /messages
  def index
  end

  def conversation
    @other_id =  params[:other]


    @user_all = Message.where(to_user: current_user.id).or(Message.where(from_user: current_user.id)).map{ |record|
      if record.to_user.to_i == current_user.id
        User.where(id: record.from_user).first
      elsif record.from_user.to_i == current_user.id
        User.where(id: record.to_user).first
      end
    }.uniq

    @other_user = User.find_by(id: @other_id)

    @chatMessages = Message.where(to_user: @other_id, from_user: current_user.id).or(Message.where(from_user: @other_id, to_user: current_user.id)).map{|msg|
      if msg.from_user.to_i==current_user.id
        {from: "You", body: msg.content, time: msg.created_at, ava: 7}
      else
        {from: @other_user.first_name, body: msg.content, time: msg.created_at, ava: 6}
      end
    }

  end


  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    @finaldata  = []

    if @message.save
      redirect_to (request.referer.nil? ? @message: request.referer)#, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :to_user, :from_user)
    end
end
