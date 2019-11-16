require "airport"

describe Airport do

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialize" do

    it "can override the instance variable capacity" do
      airport = Airport.new(50)
      plane = Plane.new
      50.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end

  end

  describe "#land" do

    it "should be able to land one plane" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it "should raise an error when the airport is full" do
      airport = Airport.new
      plane = Plane.new
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end

  end

  describe "#take_off" do

    it "should be able to take off a plane" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end

    it "should raise an error when the airport is empty" do
      airport = Airport.new
      expect { airport.take_off }.to raise_error("The airport is empty")
    end

  end

end
