require 'rails_helper'

RSpec.describe 'images index', type: :request do
  describe 'happy path' do
    it 'should return a successful response with valid params', :vcr do
      get api_v1_backgrounds_path, params: { location: 'Denver,CO' }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(json[:data]).to be_a(Hash)
      expect(json[:data].keys).to eq([:id, :type, :attributes])

      expect(json[:data][:id]).to eq("51183176746")
      expect(json[:data][:type]).to eq('image')

      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes].keys).to eq([:id, :image, :credit])

      expect(json[:data][:attributes][:credit]).to be_a(Hash)
      expect(json[:data][:attributes][:credit].keys).to eq([:author, :taken, :url])
    end
  end

  describe 'sad path' do
    it 'should return error if params are invalid', :vcr do
      get api_v1_backgrounds_path

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq("Invalid params")
    end
  end
end
