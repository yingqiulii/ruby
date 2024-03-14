# class BooksController < ApplicationController
#   def index
#     @books = Book.all
#   end
#   def show
#     @book = Book.find(params[:id])
#   end
#   def index
#     @books = Book.page(params[:page]).per(10)
#   end
# end
class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.where("title LIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
    else
      @books = Book.page(params[:page]).per(10)
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @query = params[:query]
    @books = Book.where("title LIKE ?", "%#{@query}%")
  end
end

