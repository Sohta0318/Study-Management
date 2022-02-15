class MessagesController < ApplicationController
  def index
    @message = Message.new
    user = User.first
    @messages = user.messages
    @userName = params[:name]
  end
  def show; end
  def edit; end
  def destroy; end
def create 
  @userName = params[:name]
  user = User.first
  message = user.messages.build(message_params)
  if message.save
redirect_to messages_path 
  end

  def has_user

  end
end

private 
def message_params
params.require(:message).permit(:message)
end

end