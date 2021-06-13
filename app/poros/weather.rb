class Weather

  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather,
              # :datetime,
              :sunrise
              # :sunset,
              # :temperature,
              # :feels_like,
              # :humidity,
              # :uvi,
              # :visibility,
              # :conditions,
              # :icon

  def initialize(weather_data)
    @id = nil
    @current_weather = weather_data[:current]
    @daily_weather = weather_data[:daily]
    @hourly_weather = weather_data[:hourly]

  #   @datetime = Time.at(@current_weather[:dt])
    @sunrise = Time.at(@current_weather[:sunrise])
  #   @sunset = Time.at(@current_weather[:sunset])
  #   @temperature = to_farenheit(@current_weather[:temp])
  #   @feels_like = to_farenheit(@current_weather[:feels_like])
  #   @humidity = @current_weather[:humidity]
  #   @uvi = @current_weather[:uvi]
  #   @visibility = @current_weather[:visibility]
  #   @conditions = @current_weather[:weather].first[:description]
  #   @icon = @current_weather[:weather].first[:icon]
  end
  #
  # def to_farenheit(temp)
  #   ((temp - 273.15) * 9/5 + 32).round(2)
  # end

end
