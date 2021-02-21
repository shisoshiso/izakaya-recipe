class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    return unless following.save

    flash[:notice] = 'ユーザーをフォローしました'
    redirect_to user_path(@user)
  end

  def destroy
    following = current_user.unfollow(@user)
    return unless following.destroy

    flash[:notice] = 'ユーザーのフォローを解除しました'
    redirect_to user_path(@user)
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end