class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@comment.recipe)
    else
      @recipe = @comment.recipe
      @comments = @recipe.comments
      render 'recipes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
