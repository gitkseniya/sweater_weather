class BookFacade

  def self.get_books(location, quantity)
    book_data = BookService.get_books(location)

    Books.new(book_data, quantity)
  end

end
