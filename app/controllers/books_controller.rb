class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    # not sure yet where the redirect should go to
    redirect_to root_path, status: :see_other
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :isbn, :author, :category)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
