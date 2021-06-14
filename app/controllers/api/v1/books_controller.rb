class Api::V1::BooksController < ApplicationController
  def index
    coordinates = LocationFacade.get_lat_lon(params[:location])
    weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)
    current_weather = weather.current_weather

    destination = params[:location]
    conditions = weather.current_weather.conditions
    temperature = weather.current_weather.temperature

    books = BooksFacade.get_books(destination, params[:quantity], conditions, temperature)

    render json: BooksSerializer.new(books)
  end
end
