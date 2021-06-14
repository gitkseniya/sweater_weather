class BooksFacade

  def self.get_books(destination, quantity, conditions, temperature)
    book_data = BooksService.get_books(destination)

    Books.new(book_data, destination, quantity, conditions, temperature)
  end
end
