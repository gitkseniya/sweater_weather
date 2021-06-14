class Books
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(book_data, destination, quantity, weather)
    @id = nil
    @destination = destination
    @total_books_found = book_data[:num_found]
    @forecast = BookForecast.new(weather)
    @books = book_data[:docs].map do |d|
      Book.new(d)
    end
  end
end
