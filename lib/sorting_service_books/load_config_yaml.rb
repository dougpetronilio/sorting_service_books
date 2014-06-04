require "yaml"
module SortingServiceBooks
  class LoadConfigYaml
    
    attr_accessor :file_config, :orders, :books

    def initialize(file_config)
      @file_config = file_config
      @orders = get_conditions || []
      @books = get_books || []
    end

    private
    def get_conditions
      orders = []
      config = YAML::load_file @file_config
      config["conditions"].each do |condition|
        order = Order.new(condition["key"].to_sym, condition["value"].to_sym)
        orders << order if order != nil
      end if config["conditions"]
      orders
    end

    def get_books
      books = []
      config = YAML::load_file @file_config
      config["books"].each do |b|
        book = Book.new(b["title"], b["author"], b["edition"])
        books << book if book != nil
      end if config["books"]
      books
    end
  end
end
