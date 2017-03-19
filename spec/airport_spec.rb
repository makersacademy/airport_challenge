require "airport.rb"

describe Airport do

  describe "#initialize" do

    it "airport has a default capacity of 20" do
      airport = Airport.new
      expect(airport.capacity).to eq 20
    end

    it "gives possibility to override capacity of the airport" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end

  end

  describe "#full?" do

    it "raises an error if airport is full" do
      airport = Airport.new
      plane = "potatoes"
      airport.capacity.times { airport.planes << plane }
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
