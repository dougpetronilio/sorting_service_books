require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SortingServiceBooks

  describe "Client" do
    
    before(:each) do
      @book1 = Book.new("Java How to Program", "Deitel & Deitel", "2007")
      @book2 = Book.new("Patterns of Enterprise Application Architecture", "Martin Fowler", "2002")
      @book3 = Book.new("Head First Design Patterns", "Elisabeth Freeman", "2004")
      @book4 = Book.new("Internet & World Wide Web: How to Program", "Deitel & Deitel", "2007")
    end
    
    context "Client start with path to file correct" do
      it "return list books and sort books to one condition" do
        file = "config_one_condition.yml"
        client = Client.new(file)
        
        expect(client.books[0].title).to eq(@book1.title)
        expect(client.sort[0].title).to eq(@book3.title)
      end
      
      it "return list books and sort books to two conditions" do
        file = "config_two_conditions.yml"
        client = Client.new(file)
        
        expect(client.books[0].title).to eq(@book1.title)
        expect(client.sort[0].title).to eq(@book1.title)
      end
      
      it "return list books and sort books to two conditions" do
        file = "config_three_conditions.yml"
        client = Client.new(file)
        
        expect(client.books[0].title).to eq(@book1.title)
        expect(client.sort[0].title).to eq(@book4.title)
      end
      
      it "return empty to books and conditions empty" do
        file = "config_without_condition.yml"
        
        client = Client.new(file)
        expect(client.sort).to eq([])
      end
    end
  end
end