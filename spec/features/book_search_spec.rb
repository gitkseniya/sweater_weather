require 'rails_helper'

RSpec.describe 'books API', type: :request do
  describe 'happy path' do
    it 'should return result and correct attributes', :vcr do
      get api_v1_book_search_path, params: { location: 'Denver, CO',
        quantity: 3
      }

      json = JSON.parse(response.body, symbolize_names: true)

      books = json[:data]

      expect(response).to be_successful

      expect(books).to be_a(Hash)
      expect(books[:id]).to eq(nil)
      expect(books[:type]).to eq('books')
      expect(books[:attributes]).to be_an(Hash)
      expect(books[:attributes].keys).to eq([:destination, :forecast, :total_books_found, :books])
    end
  end

  describe 'sad path' do
    it 'should return error', :vcr do

      get api_v1_book_search_path, params: { location: 'Denver, CO',
        quantity: 0
      }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end
  end

end
