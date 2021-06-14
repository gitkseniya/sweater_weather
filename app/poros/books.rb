class Books
  attr_reader :id,
              :destination,
              :total_books_found,
              :books

  def initialize(book_data, quantity)
    @id = nil
    @total_books_found = book_data[:num_found]
    @books = book_data[:docs].map do |d|
      Book.new(d)
    end
  end
end
