class Api::V1::SearchController < ApplicationController

  def show
    if params[:location] && !params[:location].empty?
      coordinates = LocationFacade.get_lat_lon(params[:location])
      weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)

      render json: ForecastSerializer.new(weather)
    else
      invalid_params
    end
  end
end
