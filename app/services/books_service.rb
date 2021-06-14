class BooksService < BaseService

  def self.get_books(location)
    response = conn('http://openlibrary.org').get('/search.json') do |f|
      f.params['q'] = 'travel+#{location}'
    end
    format_json(response)
  end
end
