class SearchController < ApplicationController

  def index
    @location = LocationFacade.get_lat_long(city)
    # @weather = WeatherFacade.get_details(@location)
  end
end
