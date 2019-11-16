require "airport"

describe Airport do

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialize" do

    it "should be able to override the instance variable capacity" do
      airport = Airport.new(50, double(:weather, stormy?: false))
      plane = double(:plane)
      50.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end

  end

  describe "#land" do

    context "when the weather is stormy" do

      it "should raise an error" do
        airport = Airport.new(1, double(:weather, stormy?: true))
        plane = double(:plane)
        expect { airport.land(plane) }.to raise_error("The weather is stormy")
      end

    end

    context "when the weather is not stormy" do
    
      it "should raise an error when the airport is full" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane = double(:plane)
        airport.capacity.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error("The airport is full")
      end

      it "should be able to land one plane when the airport is not full" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane = double(:plane)
        expect(airport.land(plane)).to eq plane
      end

    end

  end

  describe "#take_off" do

    context "when the weather is stormy" do

      it "should raise an error" do
        airport = Airport.new(1, double(:weather, stormy?: true))
        plane = double(:plane)
        expect { airport.take_off(plane) }.to raise_error("The weather is stormy")
      end

    end

    context "when the weather is not stormy" do

      it "should raise an error when the airport is empty" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane = double(:plane)
        expect { airport.take_off(plane) }.to raise_error("The airport is empty")
      end

      it "should be able to take off a plane when the airport is not empty" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane = double(:plane)
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it "should raise an error if the plane has landed in a different airport" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane1 = double(:plane)
        plane2 = double(:plane)
        airport.land(plane1)
        expect { airport.take_off(plane2) }.to raise_error("Plane not landed in this airport")
      end

    end

  end

end
