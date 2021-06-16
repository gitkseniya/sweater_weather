require 'rails_helper'

RSpec.describe 'new session create', type: :request do
  before :each do
    @user = User.create(
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password')
  end

  describe 'happy path' do
    it 'should create a new session if params are valid' do
      input = {
                      "email": "whatever@example.com",
                      "password": "password"
                    }

      post api_v1_sessions_path, params: input
      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:type]).to eq('users')
      expect(json[:data][:attributes][:email]).to eq(@user.email)
      expect(json[:data][:attributes][:api_key]).to eq(@user.api_key)
    end
  end

  describe 'sad path' do
    it 'should return error if email is invalid' do
      input = {
                  "email": "notwhatever@example.com",
                  "password": "password"
                    }

      post api_v1_sessions_path, params: input

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('Invalid email or password')
    end

    it 'should return error if password is invalid' do
      input = {
                  "email": "whatever@example.com",
                  "password": "notpassword"
                    }

      post api_v1_sessions_path, params: input

      request.headers['Content-Type'] = 'application/json'
      request.headers['Accept'] = 'application/json'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)

      expect(json[:error]).to eq('Invalid email or password')
    end
  end
end
