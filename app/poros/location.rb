class Location
  attr_reader :lat,
              :lon

  def initialize(location_data)
    @lat = location_data[:results].first[:locations].first[:latLng][:lat]
    @lon = location_data[:results].first[:locations].first[:latLng][:lng]
  end

end
