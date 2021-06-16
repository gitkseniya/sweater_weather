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
      VCR.use_cassette('forecast API/happy_path/should return result and correct attributes') do

      get api_v1_forecast_path, params: { location: 'Phoenix, AZ' }

      json = JSON.parse(response.body, symbolize_names: true)

      daily_weather = json[:data][:attributes][:daily_weather]

      expect(response).to be_successful

      expect(daily_weather[0][:date]).to be_a(String)
        expect(daily_weather[0][:sunrise]).to be_a(String)
        expect(daily_weather[0][:sunset]).to be_a(String)
        expect(daily_weather[0][:max_temp]).to be_a(Float)
        expect(daily_weather[0][:min_temp]).to be_a(Float)
        expect(daily_weather[0][:conditions]).to be_a(String)
        expect(daily_weather[0][:icon]).to be_a(String)
      end
    end

    it 'should return hourly weather and its attributes' do
      VCR.use_cassette('forecast API/happy_path/should return result and correct attributes') do

        get api_v1_forecast_path, params: { location: 'Phoenix, AZ' }

        json = JSON.parse(response.body, symbolize_names: true)

        hourly_weather = json[:data][:attributes][:hourly_weather]

        expect(hourly_weather[0][:time]).to be_a(String)
        expect(hourly_weather[0][:temperature]).to be_a(Float)
        expect(hourly_weather[0][:conditions]).to be_a(String)
        expect(hourly_weather[0][:icon]).to be_a(String)
      end
    end
  end

  describe 'sad path' do
    it 'should return error if invalid params', :vcr do

      get api_v1_forecast_path, params: { location: '' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to eq('Invalid params')
    end
  end
end
