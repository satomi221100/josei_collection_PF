class FavoritesController < ApplicationController
  def create
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:id])
    @book_favorite.save
  redirect_to books_path
  end

  def destroy
    @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:id])
    @book_favorite.destroy
  redirect_to books_path
  end
end
