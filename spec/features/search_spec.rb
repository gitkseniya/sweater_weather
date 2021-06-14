require 'rails_helper'

RSpec.describe 'forecast API', type: :request do
  describe 'happy path' do
    it 'should return result', :vcr do
      get api_v1_forecast_path, params: { location: 'Phoenix, AZ' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:id]).to eq(nil)
      expect(json[:data][:type]).to eq('forecast')
      expect(json[:data][:attributes]).to be_an(Hash)
      expect(json[:data][:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
    end
  end
end
