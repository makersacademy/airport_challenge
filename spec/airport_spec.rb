require "airport.rb"

describe Airport do

  describe "#initialize" do

    it "airport has a capacity of 2" do
      airport = Airport.new
      expect(airport.capacity).to eq 2
    end

    it "raises an error if airport is full" do
      airport = Airport.new
      plane = "potatoes"
      airport.planes << plane
      airport.planes << plane
      expect { airport.full? }.to raise_error "full"
    end

    it "doesn't raise an error if error if airport is not full" do
      airport = Airport.new
      plane = "cupcakes"
      airport.planes << plane
      expect { airport.full? }.not_to raise_error
    end

  end

end
