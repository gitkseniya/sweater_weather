class LocationFacade

  def self.get_lat(location)
    LocationService.get_lat_lon(location)
  end

  def self.get_lon(location)
    LocationService.get_lat_lon(location)
  end

end
