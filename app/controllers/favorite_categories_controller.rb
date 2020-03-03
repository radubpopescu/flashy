class FavoriteCategoriesController < ApplicationController
  def new
    @favorite_category = FavoriteCategory.new
  end

  def create
    favorite_category_params[:category_id].each do |category_id|
      @favorite_category = FavoriteCategory.create(category_id: category_id, user_id: current_user.id)
    end
    redirect_to root_path
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def favorite_category_params
    params.require(:favorite_category).permit(category_id: [])
  end
end
