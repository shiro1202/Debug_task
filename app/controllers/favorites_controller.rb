class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
    unless Favorite.find_by(book_id: params[:book_id], user_id: current_user.id).present?
      @favorite = current_user.favorites.new(:book_id => params[:book_id])
      @favorite.save
    end
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    if Favorite.find_by(book_id: params[:book_id], user_id: current_user.id).present?
      @favorite = Favorite.find_by(user_id: current_user, book_id: params[:book_id])
      @favorite.destroy
    end
  end
end
