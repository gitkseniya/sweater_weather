class Api::V1::BooksController < ApplicationController
  def index
    coordinates = LocationFacade.get_lat_lon(params[:location])
    weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)

    books = BookFacade.get_books(params[:location], params[:quantity])

    render json: ForecastSerializer.new(weather)
  end
end
