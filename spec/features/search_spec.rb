require 'rails_helper'

RSpec.describe 'forecast API', type: :request do
  describe 'happy path' do
    it 'should return result and correct attributes', :vcr do
      get api_v1_forecast_path, params: { location: 'Phoenix, AZ' }

      json = JSON.parse(response.body, symbolize_names: true)

      weather = json[:data]

      expect(response).to be_successful

      expect(weather).to be_a(Hash)
      expect(weather[:id]).to eq(nil)
      expect(weather[:type]).to eq('forecast')
      expect(weather[:attributes]).to be_an(Hash)
      expect(weather[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
    end

    it 'should return current weather and its attributes' do
      VCR.use_cassette('forecast API/happy_path/should return result and correct attributes') do

      get api_v1_forecast_path, params: { location: 'Phoenix, AZ' }

      json = JSON.parse(response.body, symbolize_names: true)

      current_weather = json[:data][:attributes][:current_weather]

      expect(response).to be_successful

      expect(current_weather[:datetime]).to be_a(String)
        expect(current_weather[:sunrise]).to be_a(String)
        expect(current_weather[:sunset]).to be_a(String)
        expect(current_weather[:temperature]).to be_a(Float)
        expect(current_weather[:feels_like]).to be_a(Float)
        expect(current_weather[:humidity]).to be_an(Integer)
        expect(current_weather[:uvi]).to be_a(Float)
        expect(current_weather[:visibility]).to be_an(Integer)
        expect(current_weather[:conditions]).to be_a(String)
        expect(current_weather[:icon]).to be_a(String)
      end
    end

    it 'should return daily weather and its attributes' do

    end

    it 'should return hourly weather and its attributes' do

    end
  end
end
