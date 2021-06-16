class RoadTripFacade

  def self.get_trip_details(origin, destination)
    trip = RoadTripService.get_trip_details(origin, destination)

    location_data = LocationFacade.get_lat_lon(destination)

    weather = WeatherFacade.get_details(location_data.lat, location_data.lon)

    if trip != 'unable to proceed'
        RoadTrip.new(trip, weather, origin, destination)
    else
      GhostCity.new(trip, weather, origin, destination)
    end
  end
end
