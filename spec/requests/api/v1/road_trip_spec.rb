require 'rails_helper'

RSpec.describe 'Api::V1::RoadTrips Create', type: :request do
  before :each do
    @user = User.create(
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password')

      @user.update(api_key: SecureRandom.hex)
  end

  describe 'happy path' do
    it 'should return a successful response', :vcr do
      input = {
                      "origin": "Denver,CO",
                      "destination": "Pueblo,CO",
                      "api_key": @user.api_key
                    }

      post api_v1_road_trip_path, params: input

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:type]).to eq('road_trip')
      expect(json[:data][:attributes][:start_city]).to eq('Denver,CO')
      expect(json[:data][:attributes][:end_city]).to eq('Pueblo,CO')

      attributes = json[:data][:attributes]
      expect(attributes.keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
      expect(attributes[:travel_time]).to be_a(String)
      expect(attributes[:travel_time]).to eq("1h 44min")
      expect(attributes[:weather_at_eta]).to be_a(Hash)
      expect(attributes[:weather_at_eta].keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    end
  end

    it 'should return travel time as impossible if the route cant be driven', :vcr do
      input = {
                      "origin": "Denver,CO",
                      "destination": "Minsk,BY",
                      "api_key": @user.api_key
                    }

      post api_v1_road_trip_path, params: input

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)

      expect(json[:data][:type]).to eq('road_trip')
      expect(json[:data][:attributes][:start_city]).to eq('Denver,CO')
      expect(json[:data][:attributes][:end_city]).to eq('Minsk,BY')
      expect(json[:data][:attributes][:travel_time]).to eq('impossible')
      expect(json[:data][:attributes][:weather_at_eta]).to eq("")
    end

    it 'should return error for missing destination', :vcr do
      input = {
                      "origin": "denver,co",
                      "destination": "",
                      "api_key": @user.api_key
                    }

      post api_v1_road_trip_path, params: input

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq("Origin or destination field is missing")
    end

    it 'should return error for missing origin', :vcr do
      input = {       "origin": "",
                      "destination": "Miami,FL",
                      "api_key": @user.api_key
                    }

      post api_v1_road_trip_path, params: input

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq("Origin or destination field is missing")
    end
end
