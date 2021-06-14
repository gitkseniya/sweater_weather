class Book
  attr_reader :title,
              :publisher
              # :isbn

  def initialize(d)
    # @isbn = d[:isbn]
    @title = d[:title]
    @publisher = d[:publisher]
  end
end
