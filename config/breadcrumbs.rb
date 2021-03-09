crumb :root do
  link "居酒屋レシピ トップ", root_path
end

crumb :recipe_new do
  link "レシピ新規投稿", new_recipe_path
  parent :root
end

crumb :recipe_search do
    link "「#{params["keyword"]}」のレシピ検索結果", search_recipes_path
  parent :root
end

crumb :category_search do
  category_id = params[:q][:category_id_eq]
  @category = Category.find_by(id: category_id)
  link "「#{@category.name}」のレシピ検索結果", recipe_category_path
parent :root
end

crumb :about do
  link "居酒屋レシピとは", page_path('about')
  parent :root
end

crumb :recipe_show do
  link "レシピ詳細表示", recipe_path
  parent :root
end

crumb :recipe_edit do
  link "レシピ編集", edit_recipe_path
  parent :recipe_show
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).