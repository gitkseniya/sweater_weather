class WeatherFacade

  def self.get_details(lat, lon)
    weather_data= WeatherService.get_details(lat, lon)

    Weather.new(weather_data)
  end
end
