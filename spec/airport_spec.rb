require 'airport'

describe Airport do
  context "Methods to ensure safety" do

    it "returns true if more than 100 planes are already parked i.e airport is full" do
      airport = Airport.new(101)
      expect(airport.full).to be true
    end
  end
end
