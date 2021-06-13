class DailyWeather

  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @max_temp = to_farenheit(data[:temp][:max])
    @min_temp = to_farenheit(data[:temp][:min])
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def to_farenheit(temp)
    ((temp - 273.15) * 9/5 + 32).round(2)
  end

end
