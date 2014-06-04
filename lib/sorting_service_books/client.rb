module SortingServiceBooks

  class Client
    attr_accessor :books

    def initialize(file)
      @config = LoadConfigYaml.new(file)
      @books = @config.books
      @conditions = @config.orders
      @sort_books = SortBooks.new(@books, @conditions)
    end

    def sort
      @sort_books.sort
    end

  end
end
