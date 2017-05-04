class UsersController < ApplicationController
  before_action :authenticate_user!

  def book
    current_user.flight_id = params[:id]
    current_user.save
    flash[:notice] = "Congrats! You've booked Flight##{params[:id]} from somewhere to somewhere"
    redirect_to flights_path
  end
end
