class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  helper :all

  # GET /messages
  def index
    @messages = Message.where(to_user: current_user.id).or(Message.where(from_user: current_user.id))
    @data  = []
    for msg in @messages do 
      if msg.to_user.to_i == current_user.id
        @data.push(msg.from_user.to_i)
      else
        @data.push(msg.to_user.to_i)
      end
    end
    @finaldata = @data.uniq

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
