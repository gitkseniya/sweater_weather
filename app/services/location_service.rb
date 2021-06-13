class LocationService < BaseService

  def self.get_lat_lon(location)
    response = conn('http://www.mapquestapi.com').get('geocoding/v1/address') do |f|
      f.params['location'] = location
      f.params['key'] = ENV['mapquest_key']
    end
    format_json(response)
  end
end
