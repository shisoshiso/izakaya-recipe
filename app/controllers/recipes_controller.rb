class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update]
  before_action :authenticate_user!, except: [:index, :show, :search, :new_guest, :category]
  before_action :move_to_index, only: [:edit]
  before_action :create_searching_object, only: [:index, :search_recipe, :show]

  def index
    @recipes = Recipe.all.order('created_at DESC').page(params[:page]).per(6)
    favorited_recipes = Recipe.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @favorited_recipes = Kaminari.paginate_array(favorited_recipes).page(params[:page]).per(6)
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
    @all_recipes = Recipe.search(params[:keyword])
    @recipes = Recipe.search(params[:keyword]).page(params[:page]).per(12)
  end

  def search_recipe
    @results = @p.result
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

  def create_searching_object
    @p = Recipe.ransack(params[:q]) 
  end
end
