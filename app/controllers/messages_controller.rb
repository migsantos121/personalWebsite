class MessagesController < ApplicationController
  
  def create
    message = Message.create(message_params) do | m|
      m.username = current_username
    end
    MessageRelayJob.perform_later(message) if message.valid?
    head :ok
  end

  def index
    @messages = Message.all
    @message = Message.new
    @message.username = "Miguel"
  end

  def enter_room
    username = params[:username]
    redirect_to action: "index"
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
