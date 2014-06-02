require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SortingServiceBooks

  describe "Order" do
    describe "#new" do
      it "create the order with params" do
        order = Order.new(:title, :asc)
        
        expect(order.key).to eq :title
        expect(order.value).to eq :asc
      end
    end
  end
end