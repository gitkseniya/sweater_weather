require 'rails_helper'

RSpec.describe 'new user create', type: :request do
  describe 'happy path' do
    it 'should return a valid response' do
      info = {
                      "email": "email@email.com",
                      "password": "123",
                      "password_confirmation": "123"
                    }

      post api_v1_users_path, params: info

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:type]).to eq('users')
      expect(json[:data][:attributes][:email]).to eq('email@email.com')
      expect(json[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe 'sad path' do
    it 'should return error when email already exists' do
      @user = User.create(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '123')

      input = {
                    "email": "email@email.com",
                    "password": "123",
                    "password_confirmation": "123"
              }

      post api_v1_users_path, params: input
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)

      expect(json[:error]).to eq("User is already registered")
    end

    it 'it should return error when new users passwords dont match' do

      input = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password123"
                    }

      post api_v1_users_path, params: input
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('Unsuccessful request')
    end

    it 'it should return error when email is empty' do
      input = {
                    "email": "",
                    "password": "password",
                    "password_confirmation": "password123"
                    }

      post api_v1_users_path, params: input
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq("Unsuccessful request")
    end

    it 'it should return error for missing password' do
      input = {
                        "email": "whatever@example.com",
                        "password": "password",
                        "password_confirmation": ""
                      }

      post api_v1_users_path, params: input
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq("Unsuccessful request")
    end
  end
end
