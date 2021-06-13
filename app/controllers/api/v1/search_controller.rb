class SearchController < ApplicationController

  def show
    lat = LocationFacade.get_lat(city)
    lon = LocationFacade.get_lon(city)
    
    @weather = WeatherFacade.get_details(lat, lon)
  end
end
