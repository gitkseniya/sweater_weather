class Weather

  attr_reader :id,
              :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(weather_data)
    @id = nil
    current = weather_data[:current]

    @datetime = Time.at(current[:dt])
    @sunrise = Time.at(current[:sunrise])
    @sunset = Time.at(current[:sunset])
    @temperature = to_farenheit(current[:temp])
    @feels_like = to_farenheit(current[:feels_like])
    @humidity = current[:humidity]
    @uvi = current[:uvi]
    @visibility = current[:visibility]
    @conditions = current[:weather].first[:description]
    @icon = current[:weather].first[:icon]
  end

  def to_farenheit(temp)
    ((temp - 273.15) * 9/5 + 32).round(2)
  end

end
