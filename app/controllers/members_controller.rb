class MembersController < ApplicationController
  def index
  @members = User.all
  end
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend)
    if current_user.save
      flash[:notice] = 'You successfully followed!'
      redirect_to members_path
    else
      flash[:alert] = 'Something went wrong'
      redirect_to members_path
    end
  end
  def edit;end
  def show
  @friends = current_user.friends
  end
  def destroy;end
end
