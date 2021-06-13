class LocationFacade

  def self.get_lat_long(city)
    LocationService.get_lat_long_db(city)
  end

end
