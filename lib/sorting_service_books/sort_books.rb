
module SortingServiceBooks

  class SortBooks
    
     attr_accessor :books, :conditions
    
    def initialize(books, conditions)
      @books = books
      @conditions = conditions
    end
    
    def sort
      raise OrderingException if @conditions.nil?

      collection = @books.sort do |a, b|
        methods_call_first = []
        methods_call_second = []
        @conditions.each do |order| 
          if order.value == :asc
            methods_call_first << a.send(order.key)
            methods_call_second << b.send(order.key)
          else
            methods_call_second << a.send(order.key)
            methods_call_first << b.send(order.key)
          end
        end
        
        methods_call_first <=> methods_call_second
      end

      collection
    end
  end

end
