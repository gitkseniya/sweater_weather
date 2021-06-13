class Api::V1::SearchController < ApplicationController

  def show
    @lat = LocationFacade.get_lat(params[:location])
    @lon = LocationFacade.get_lon(params[:location])

    @weather = WeatherFacade.get_details(@lat, @lon)
  end
end
