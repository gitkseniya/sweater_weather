class Weather
  attr_reader :id,
              :destination,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(weather_data)
    @id = nil
    @current_weather = CurrentWeather.new(weather_data[:current])
    @daily_weather = (weather_data[:daily]).first(5).map do |w|
      DailyWeather.new(w)
    end
    @hourly_weather = (weather_data[:hourly]).first(8).map do |w|
      HourlyWeather.new(w)
    end
  end
end
