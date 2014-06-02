require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SortingServiceBooks

  describe "SortingServiceBooks" do

    it "should have a version" do
      expect(SortingServiceBooks.const_defined?('VERSION')).to eq(true)
    end

  end

end
