class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def index
    @books = Book.page(params[:page]).per(10)
  end
end
