class FavoriteCategoriesController < ApplicationController
  def new
    @favorite_category = FavoriteCategory.new
  end

  def create
    current_user.favorite_categories.destroy_all
    favorite_category_params[:category_ids].each do |category_id|
      FavoriteCategory.create(category_id: category_id, user_id: current_user.id)
    end
    if current_user.favorite_categories.any?
      redirect_to root_path
  end

  private

  def favorite_category_params
    params.require(:user).permit(category_ids: [])
  end
end
