class RentalsController < ApplicationController
  before_action :set_offer, only: %i[create]

  def create
    @rental = Rental.new(rental_params)
    @rental.offer = @offer
    @rental.user = current_user

    @days = (@rental.duration_end - @rental.duration_start).to_i
    @rental.price = @offer.price * @days

    authorize @rental
    if @rental.save
      redirect_to dashboard_path
    else
      redirect_to offer_path(@rental.offer)
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:duration_start, :duration_end)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
