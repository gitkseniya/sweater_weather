class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :id

  def initialize(trip, weather, origin, destination)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = trip[:route][:time]/60
    @weather_at_eta = calculate(weather)
  end

  def calculate(weather)
    if travel_time < 60
      weather.current_weather
    elsif travel_time/60 <= 24
      weather.daily_weather[0]
    elsif 24 <= travel_time/60 < 48
      weather.daily_weather[1]
    elsif 48 <= travel_time/60 < 72
      weather.daily_weather[2]
    elsif 72 <= travel_time/60 < 96
      weather.daily_weather[3]
    elsif 96 <= travel_time/60 < 120
      weather.daily_weather[4]
    else
      "Weather data is not available"
    end
  end

end
