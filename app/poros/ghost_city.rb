class GhostCity
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :id

  def initialize(trip, weather, origin, destination)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = "impossible"
    @weather_at_eta = ""
  end
end
