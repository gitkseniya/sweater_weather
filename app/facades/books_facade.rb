class BooksFacade

  def self.get_books(location, quantity)
    book_data = BooksService.get_books(location)

    Books.new(book_data, quantity)
  end
end
