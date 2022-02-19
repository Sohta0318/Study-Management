class MembersController < ApplicationController
  before_action :require_user
  def index
  @members = User.all
  end
  def create
    friend = User.find(params[:friend])
    success = current_user.friendships.build(friend_id: friend.id)
    if success.save
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
  def destroy
    friend = current_user.friendships.find_by(friend_id:params[:id])
    if friend.destroy
      flash[:notice] = 'You successfully deleted'
      redirect_to friends_path
    else
      flash[:alert] = 'Somethings went wrong'
      redirect_to friends_path
    end
  end

  def friends
  @friends = current_user.friends
  end
end
