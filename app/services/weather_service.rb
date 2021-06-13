class WeatherService < BaseService

  def self.get_details(lat, lon)
    response = conn('https://api.openweathermap.org').get('/data/2.5/onecall') do |f|
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['appid'] = ENV['openweather_key']
    end
    format_json(response)
  end

end
