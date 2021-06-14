class BooksSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :publisher
end
