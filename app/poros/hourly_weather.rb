class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt])
    @temperature = to_farenheit(data[:temp])
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:description]
  end

  def to_farenheit(temp)
    ((temp - 273.15) * 9/5 + 32).round(2)
  end
end
