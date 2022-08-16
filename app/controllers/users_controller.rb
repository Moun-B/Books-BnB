class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @rentals = @user.rentals
    @offers = @user.offers
  end
end
