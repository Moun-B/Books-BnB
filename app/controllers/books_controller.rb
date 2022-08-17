require 'rest-client'

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized

  def index
  end

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

  def search
    query = params[:query].gsub(' ', '+')
    url = "https://www.googleapis.com/books/v1/volumes?q=#{query}&maxResults=15&key=#{ENV['GOOGLE_API_KEY']}"
    @json = JSON.parse(RestClient.get(url))['items']
    # title : item['volumeInfo']['title']
    # year : item['volumeInfo']['publishedDate'][0,4] -> string first 4 for year
    # categories : item['volumeInfo']['categories'] -> array
    # author : item['volumeInfo']['authors'] -> array
    # isbn : item['volumeInfo']['industryIdentifiers'][0]['identifier'
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :isbn, :author, :category)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
