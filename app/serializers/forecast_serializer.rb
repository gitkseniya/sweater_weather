class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sunrise
  # :current_weather, :daily_weather, :hourly_weather, :sunrise
end
