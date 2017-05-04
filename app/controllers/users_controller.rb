class UsersController < ApplicationController
  before_action :authenticate_user!

  def book
    # current_user.flights = params[:id]
    booked_flight = Flight.find(params[:id])
    current_user.flights << booked_flight
    flash[:notice] = "Congrats! You've booked Flight##{booked_flight.id} from #{booked_flight.from} to #{booked_flight.to}"
    redirect_to flights_path
  end
end
