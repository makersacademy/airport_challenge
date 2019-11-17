require "airport"

describe Airport do

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialize" do

    it "should be able to override the instance variable capacity" do
      airport = Airport.new(50, double(:weather, stormy?: false))
      50.times do
        plane = double(:plane, landed?: false, land: true)
        airport.land(plane)
      end
      plane = double(:plane, landed?: false)
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
        airport.capacity.times do
          plane = double(:plane, landed?: false, land: true)
          airport.land(plane)
        end
        plane = double(:plane, landed?: false)
        expect { airport.land(plane) }.to raise_error("The airport is full")
      end

      it "should be able to land one plane" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane = double(:plane, landed?: false, land: true)
        expect(airport.land(plane)).to eq plane
      end

      it "should raise an error if the plane has already landed" do
        airport = Airport.new(2, double(:weather, stormy?: false))
        plane1 = double(:plane, landed?: false, land: true)
        airport.land(plane1)
        plane2 = double(:plane, landed?: true)
        expect { airport.land(plane2) }.to raise_error("Plane already landed")
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

      it "should be able to take off a plane" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane = double(:plane, landed?: false, land: true, take_off: false)
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it "should raise an error if the plane has not landed in this airport" do
        airport = Airport.new(1, double(:weather, stormy?: false))
        plane1 = double(:plane, landed?: false, land: true)
        airport.land(plane1)
        plane2 = double(:plane, landed?: true)
        expect { airport.take_off(plane2) }.to raise_error("Plane not landed in this airport")
      end

    end

  end

end
