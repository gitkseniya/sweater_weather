class CurrentWeather
  attr_reader :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @sunrise = data[:sunrise]
    @datetime = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @temperature = to_farenheit(data[:temp])
    @feels_like = to_farenheit(data[:feels_like])
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def to_farenheit(temp)
    ((temp - 273.15) * 9/5 + 32).round(2)
  end

end
