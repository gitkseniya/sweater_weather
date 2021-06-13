class LocationService < BaseService
  def self.get_lat_long_db(city)
    response = conn('http://www.mapquestapi.com').get('geocoding/v1/address
      &key=') do |f|
      f.params['location'] = location
      f.params['key'] = ENV['mapquest_key']
    end
    format_json(response)
  end
end
