class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @recipes = @user.recipes.order('created_at DESC').page(params[:page]).per(12)
    @all_recipes = @user.recipes.order('created_at DESC')
    @favorited = @user.favorited.order('created_at DESC')
    @followers = current_user.followers
    @followings = current_user.followings
  end
end
