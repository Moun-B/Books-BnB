class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
    if params[:q].present?
      @offers = Offer.search(params[:q])
    else
      @offers = policy_scope(Offer)
    end
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
      redirect_to dashboard_path(tag: 'offers')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to dashboard_path(tab: "offer"), status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :condition, book_attributes: [:title, :year, :isbn, :author, :category, :description, :cover_url])
  end
end
