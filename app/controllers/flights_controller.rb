class FlightsController < ApplicationController
  def index
    @all_flights = Flight.all
    gon.flights = Flight.all
  end

  def show
    # find flight by id
    @individual_flight = Flight.find(params[:id])
    # pass the data into your js
    gon.flight = Flight.find(params[:id])
    # alert the data into the screen
  end

  def edit
    @individual_flight = Flight.find(params[:id])
  end

  def new
    @new_flight = Flight.new
  end
end
