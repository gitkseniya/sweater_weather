class Books
  attr_reader :total_book_found,
              :id

  def initialize(book_data, quantity)
    @id = nil
    @total_books_found = book_data[:numFound]
  end

end
