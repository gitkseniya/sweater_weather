class RoadTripService < BaseService

  def self.get_trip_details(origin, destination)
    response = conn('https://www.mapquestapi.com').get('/directions/v2/route') do |f|
      f.params['from'] = origin
      f.params['to'] = destination
      f.params['key'] = ENV['mapquest_key']
    end
      format_json(response)
  end
end
