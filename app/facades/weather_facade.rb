class WeatherFacade

  def self.get_details(lat, lon)
    WeatherService.get_details(lat, lon)
  end
end
