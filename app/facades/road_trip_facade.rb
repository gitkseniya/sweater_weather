class RoadTripFacade

  def self.get_trip_details(origin, destination)
    trip = RoadTripService.get_trip_details(origin, destination)

    if trip[:info][:statuscode] == 402
      return 'You are not going there buddy'
    else
      location_data = LocationFacade.get_lat_lon(destination)

      weather = WeatherFacade.get_details(location_data.lat, location_data.lon)

      RoadTrip.new(trip, weather, origin, destination)
    end
  end
end
