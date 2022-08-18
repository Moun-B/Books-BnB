require 'rest-client'

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :destroy]
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
      redirect_to new_book_offer_path(@book)
    else
      render :search, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to new_book_offer_path(@book)
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
    @books = @json.map do |book|
      Book.new(
        title: book['volumeInfo']['title'],
        year: book['volumeInfo']['publishedDate'][0,4].to_i,
        category: book['volumeInfo']['categories'] ? book['volumeInfo']['categories'][0] : '',
        author: book['volumeInfo']['authors'] ? book['volumeInfo']['authors'][0] : 'Unknown',
        isbn: book['volumeInfo']['industryIdentifiers'] ? book['volumeInfo']['industryIdentifiers'][0]['identifier'] : '',
        description: book['volumeInfo']['description'],
        cover_url: book['volumeInfo']['imageLinks'] ? book['volumeInfo']['imageLinks']['thumbnail'] : ''
      )
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :isbn, :author, :category, :cover_url, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
