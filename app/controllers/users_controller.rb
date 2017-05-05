class UsersController < ApplicationController
  before_action :authenticate_user!

  def book
    # current_user.flights = params[:id]
    booked_flight = Flight.find(params[:id])

    if booked_flight
      current_user.flights << booked_flight
      gon.current_user = current_user
      ActionCable.server.broadcast 'flight_update_channel',
                                    content: booked_flight,
                                    user: current_user,
                                    method: 'book'
    end

    # flash[:notice] = "Congrats! You've booked Flight##{booked_flight.id} from #{booked_flight.from} to #{booked_flight.to}"
    # redirect_to flights_path
  end
end
