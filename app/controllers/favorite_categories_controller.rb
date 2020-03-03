class FavoriteCategoriesController < ApplicationController
  def new
    @favorite_category = FavoriteCategory.new
  end

  def create
    @favorite_category = FavoriteCategory.new(favorite_category_params)
    if @favorite_category.save
      redirect to decks_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def favorite_category_params
    params.require(:favorite_category).permit(:user_id, :category_id)
  end
end
