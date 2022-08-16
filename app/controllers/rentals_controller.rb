class RentalsController < ApplicationController
  before_action :set_offer, only: %i[create]

  def create
    @rental = Rental.new(rental_params)
    @rental.offer = @offer
    raise
    authorize @rental
    if @rental.save
      redirect_to offers_path
    else
      redirect_to offer_path(@rental.offer)
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:duration_start(1i), :duration_start(2i), :duration_start(3i), :duration_end(1i), :duration_end(2i), :duration_end(3i), :offer_id, :user_id, :price)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
