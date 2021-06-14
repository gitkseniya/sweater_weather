class BookForecast
  attr_reader :temperature,
              :summary

  def initialize(data)
    @temperature = data.current_weather.temperature
    @summary = data.current_weather.conditions
  end
end
