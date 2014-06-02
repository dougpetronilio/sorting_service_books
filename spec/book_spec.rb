require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SortingServiceBooks

  describe "Book" do
    describe "#new" do
      it "create the book with params" do
        book = Book.new("java", "deitel", "2007")
        
        expect(book.title).to eq "java"
        expect(book.author).to eq "deitel"
        expect(book.edition).to eq "2007"
      end
    end
  end
end