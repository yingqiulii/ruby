
class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  def index
    @genres = Genre.all.page(params[:page]).per(10)
  end
  def show
    @genre = Genre.find(params[:id])
  end
end
