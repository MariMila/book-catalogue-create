class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Novo livro foi adicionado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Livro foi alterado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'O livro foi excluído com sucesso.'
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end


    def book_params
      params.require(:book).permit(:title, :author, :publication_year, :abstract, :genre)
    end
end
