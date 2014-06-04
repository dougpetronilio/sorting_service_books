require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SortingServiceBooks
  describe "LoadConfigYaml" do

    before(:each) do
      @book1 = Book.new("Java How to Program", "Deitel & Deitel", "2007")
      @book2 = Book.new("Patterns of Enterprise Application Architecture", "Martin Fowler", "2002")
      @book3 = Book.new("Head First Design Patterns", "Elisabeth Freeman", "2004")
      @book4 = Book.new("Internet & World Wide Web: How to Program", "Deitel & Deitel", "2007")
    end

    context "load config with one condition" do
      it "return configurations to one condition" do
        file = "config_one_condition.yml"
        order = Order.new(:title, :asc)
        config = LoadConfigYaml.new(file)

        expect(config.file_config).to eq(file)
        expect(config.orders[0].key).to eq(order.key)
        expect(config.orders[0].value).to eq(order.value)
      end
    end

    context "load config with two conditions" do
      it "return configurations to two conditions" do
        file = "config_two_conditions.yml"
        order1 = Order.new(:author, :asc)
        order2 = Order.new(:title, :desc)
        config = LoadConfigYaml.new(file)

        expect(config.orders[0].key).to eq(order1.key)
        expect(config.orders[0].value).to eq(order1.value)

        expect(config.orders[1].key).to eq(order2.key)
        expect(config.orders[1].value).to eq(order2.value)
      end
    end

    context "load config with three conditions" do
      it "return configurations to three conditions" do
        file = "config_three_conditions.yml"
        order1 = Order.new(:edition, :desc)
        order2 = Order.new(:author, :desc)
        order3 = Order.new(:title, :asc)
        config = LoadConfigYaml.new(file)

        expect(config.orders[0].key).to eq(order1.key)
        expect(config.orders[0].value).to eq(order1.value)

        expect(config.orders[1].key).to eq(order2.key)
        expect(config.orders[1].value).to eq(order2.value)

        expect(config.orders[2].key).to eq(order3.key)
        expect(config.orders[2].value).to eq(order3.value)
      end
    end

    context "loag config without conditions" do
      it "return a message to configuration conditions" do
        file = "config_without_condition.yml"
        config = LoadConfigYaml.new(file)

        expect(config.orders.length).to eq(0)
      end
    end

    context "load config books" do
      it "return list of books" do
        file = "config_two_conditions.yml"

        config = LoadConfigYaml.new(file)

        expect(config.books.length).to eq(4)
        expect(config.books[0].title).to eq(@book1.title)
        expect(config.books[1].title).to eq(@book2.title)
        expect(config.books[2].title).to eq(@book3.title)
        expect(config.books[3].title).to eq(@book4.title)
      end
    end
  end
end
