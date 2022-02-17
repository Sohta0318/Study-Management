class MembersController < ApplicationController
  def index
  @members = User.all
  end
  def edit;end
  def show;end
  def destroy;end
end
