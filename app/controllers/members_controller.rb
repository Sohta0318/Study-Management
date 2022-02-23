class MembersController < ApplicationController
  before_action :require_user
  def index
  @members = User.where.not(id: current_user)
  @current_user = current_user
  @search = User.where('email LIKE ?', "%#{params[:search]}%") if params[:search].present?

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
    friend = User.find(params[:id])
    all_works = friend.works
    @works =all_works.paginate(page: params[:page], per_page: 6)
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
  @current_user = current_user
  @some = @friends.any?
  end

  def graph
    friend = User.find(params[:id])
    works = friend.works
    @work_data = works.group_by_day(:created_at).sum(:hours)
    @kinds = friend.works.group(:health).count
  end
end
