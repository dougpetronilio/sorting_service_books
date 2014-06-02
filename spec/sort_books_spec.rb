require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SortingServiceBooks

  describe "SortBooks" do
    let(:java) { double("java", :id => 1, :title => "Java How to Program", :author => "Deitel & Deitel", :edition => "2007").as_null_object }
    let(:patterns) { double("patterns", :id => 2, :title => "Patterns of Enterprise Application Architecture", :author => "Martin Fowler", :edition => "2002").as_null_object }
    let(:head) { double("head", :id => 3, :title => "Head First Design Patterns", :author => "Elisabeth Freeman", :edition => "2004").as_null_object }
    let(:internet) { double("internet", :id => 4, :title => "Internet & World Wide Web: How to Program", :author => "Deitel & Deitel", :edition => "2007").as_null_object }
    
    let(:title_asc) { double("title_asc", :key => :title, :value => :asc).as_null_object}
    let(:title_desc) { double("title_desc", :key => :title, :value => :desc).as_null_object}
    let(:author_asc) { double("author_asc", :key => :author, :value => :asc).as_null_object}
    let(:author_desc) { double("author_desc", :key => :author, :value => :desc).as_null_object}
    let(:edition_asc) { double("edition_asc", :key => :edition, :value => :asc).as_null_object}
    let(:edition_desc) { double("edition_desc", :key => :edition, :value => :desc).as_null_object}
    
    before(:each) do
      @books = []
      @books << java << patterns << head << internet
      
      @conditions = []
    end
    
    after(:each) do
      @books = []
      @conditions = []      
    end
    
    describe "#new" do
      it "should params to SortBooks is correct" do
        @conditions << title_asc
        @conditions << author_asc
        sort_books = SortBooks.new(@books, @conditions)
        
        expect(sort_books.books).to match_array([java, patterns, head, internet])
        expect(sort_books.conditions).to match_array([title_asc, author_asc])
      end
    end
    
    describe "#sort" do
      context "when title asc" do
        it "return in order head, internet, java and patterns" do
          @conditions << title_asc
          sort_books = SortBooks.new(@books, @conditions)
          
          expect(sort_books.sort).to eql([head, internet, java, patterns])
        end
      end
      
      context "when author asc and title desc" do
        it "return in order java, internet, head, patterns" do
          @conditions << author_asc
          @conditions << title_desc
          sort_books = SortBooks.new(@books, @conditions)
          
          expect(sort_books.sort).to eql([java, internet, head, patterns])
        end
      end
      
      context "when edition desc, author desc, title asc" do
        it "return in order internet, java, head, patterns" do
          @conditions << edition_desc
          @conditions << author_desc
          @conditions << title_asc
          sort_books = SortBooks.new(@books, @conditions)
          
          expect(sort_books.sort).to eql([internet, java, head, patterns])
        end
      end
      
      context "when conditions is nil" do
        it "return OrderingException if conditions is nil" do
          @conditions = nil
          sort_books = SortBooks.new(@books, @conditions)
          expect { sort_books.sort }.to raise_error OrderingException
        end
      end
      
      context "when conditions or books is empty" do
        it "return empty array" do
          @conditions = []
          @books = []
          sort_books = SortBooks.new(@books, @conditions)
          expect(sort_books.sort).to eq([])
        end
      end
    end

  end

end
