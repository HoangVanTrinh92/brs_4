class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
    @readstate = ReadState.latest current_user.id, @book.id
    @state = @readstate.first.state if @readstate.present?
  end

  private
    def book_params
      params.require(:book).permit(:title, :publish_date, :author, 
        :number_page, :category, :picture)
    end
end