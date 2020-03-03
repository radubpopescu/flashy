class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @favorite_category = FavoriteCategory.new
  end
end
