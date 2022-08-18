class RentalsController < ApplicationController
  before_action :set_offer, only: %i[create]

  def create
    @rental = Rental.new(rental_params)
    @rental.offer = @offer
    @rental.user = current_user
    authorize @rental
    if @rental.save
      redirect_to dashboard_path
    else
      redirect_to offer_path(@rental.offer)
      # flash[:message] = "Missing Fields"
    end
  end

  def update
    @rental = Rental.find(params[:id])
    authorize @rental
    if @rental.update(rental_params)
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:status, :duration_start, :duration_end)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
