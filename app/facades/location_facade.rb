class LocationFacade

  def self.get_lat(city)
    LocationService.get_lat_lon(city)
  end

  def self.get_lon(city)
    LocationService.get_lat_lon(city)
  end

end
