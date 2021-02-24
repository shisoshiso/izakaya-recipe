class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update]
  before_action :authenticate_user!, except: [:index, :show, :search, :new_guest]
  before_action :move_to_index, only: [:edit]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
    @favorite = Favorite.new
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path
  end

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @recipe.user_id
  end

  def recipe_params
    params.require(:recipe).permit(:name, :material, :alcohol_id, :category_id, :genre_id, :explanation, :point, :user_id,
                                   :image).merge(user_id: current_user.id)
  end
end
