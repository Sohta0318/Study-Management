class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = current_user.messages
  end
def create 

  message = current_user.messages.build(message_params)
  message.friend_id = User.last
  if message.save
redirect_to messages_path 
  else
    redirect_to root_path
  end

end

private 
def message_params
params.require(:message).permit(:message)
end

end