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
end
