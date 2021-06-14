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
      expect(books[:attributes]).to be_a(Hash)
      expect(books[:attributes].keys).to eq([:destination, :forecast, :total_books_found, :books])

      book_list = books[:attributes][:books]
      expect(book_list).to be_an(Array)
      expect(book_list.size).to eq(3)
      expect(book_list.first).to be_a(Hash)
      expect(book_list.first.keys).to eq([:isbn, :title, :publisher])

      first_book = book_list.first
      expect(first_book[:isbn]).to be_an(Array)
      expect(first_book[:title]).to eq("Mobil Travel Guide")
      expect(first_book[:publisher]).to be_an(Array)
      expect(first_book[:publisher].first).to eq("Mobil Travel Guide")
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
