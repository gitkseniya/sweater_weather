class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather
end
