class Api::V1::BooksController < ApplicationController
  def index
    coordinates = LocationFacade.get_lat_lon(params[:location])
    weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)

    destination = params[:location]

    books = BooksFacade.get_books(destination, params[:quantity], weather)

    render json: BooksSerializer.new(books)
  end
end
