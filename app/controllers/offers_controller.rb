class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
  end

  def show
    @offer = Offer.find(params[:id])
    @offers = policy_scope(Offer)
    @rental = Rental.new
    authorize @offer
  end

  def new
    @offer = Offer.new
    @book = Book.find(params[:book_id])
    authorize @offer
  end

  def create
    @book = Book.find(params[:book_id])
    @offer = Offer.new(offer_params)
    @offer.book = @book
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to :dashboard
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:price, book_attributes: [:title, :year, :isbn, :author, :category, :description, :cover_url])
  end
end
