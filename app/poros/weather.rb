class Weather

  attr_reader :id,
              :current_weather
              # :daily_weather,
              # :hourly_weather

  def initialize(weather_data)
    @id = nil
    @current_weather = CurrentWeather.new(weather_data)
  #   @daily_weather = weather_data[:daily]
  #   @hourly_weather = weather_data[:hourly]
  end
end
