class LocationFacade

  def self.get_lat_lon(location)
    location_data = LocationService.get_lat_lon(location)
    Location.new(location_data)
  end

end
