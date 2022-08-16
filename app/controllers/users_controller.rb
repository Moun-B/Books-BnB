class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @rentals = @user.rentals
    @offers = @user.offers
  end

  def dashboard
    @user = current_user
    authorize @user
    if user_signed_in?
      @books = @user.books
      @rentals = @user.rentals
      @offers = @user.offers
    else
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
