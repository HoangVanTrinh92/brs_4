class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
    @reviews = @book.reviews.paginate(page: params[:page])
   
  end

  private
    def book_params
      params.require(:book).permit(:title, :publish_date, :author, 
        :number_page, :category, :picture)
    end
end