class BooksFacade

  def self.get_books(destination, quantity, weather)
    book_data = BooksService.get_books(destination)

    Books.new(book_data, destination, quantity, weather)
  end
end
