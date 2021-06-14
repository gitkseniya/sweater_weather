class Api::V1::BooksController < ApplicationController
  def index
    coordinates = LocationFacade.get_lat_lon(params[:location])
    weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)

    books = BooksFacade.get_books(params[:location], params[:quantity])

    # render json: BookSerializer.new(books)
  end
end
