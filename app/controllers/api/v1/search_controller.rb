class Api::V1::SearchController < ApplicationController

  def show
    coordinates = LocationFacade.get_lat_lon(params[:location])

    weather = WeatherFacade.get_details(coordinates.lat, coordinates.lon)

    json_resp = ForecastSerializer.new(weather)
    render json: json_resp, include: '**'
  end
end
