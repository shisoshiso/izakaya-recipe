class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @recipes = @user.recipes.order('created_at DESC')
    @favorited = @user.favorited.order('created_at DESC')
    @followers = current_user.followers
    @followings = current_user.followings
  end
end
