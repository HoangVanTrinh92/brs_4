class FavouritesController < ApplicationController
  def create
    @book = Book.find params[:book_id]
    current_user.create_favourite @book
    respond_to do |format|
      format.html {redirect_to @book}
      format.js
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id]).destroy
    @book = @favourite.book
    respond_to do |format|
      format.html {redirect_to @book}
      format.js
    end
  end
end
