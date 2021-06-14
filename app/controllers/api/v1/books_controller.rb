class Api::V1::BooksController < ApplicationController
  def index
    if params[:quantity].to_i > 0 && params[:location] && real_location(params[:location])
      coordinates = LocationFacade.get_lat_lon(params[:location])
      weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)

      destination = params[:location]

      books = BooksFacade.get_books(destination, params[:quantity], weather)

      render json: BooksSerializer.new(books)
    else
      invalid_params
    end
  end

  private

  def real_location(location)
    return false if BooksService.get_books(location).empty?
    true
  end
end
