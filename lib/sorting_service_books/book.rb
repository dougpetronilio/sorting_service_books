
module SortingServiceBooks
  class Book
    attr_accessor :title, :author, :edition
    
    def initialize(title, author, edition)
      @title = title
      @author = author
      @edition = edition
    end
  end
end