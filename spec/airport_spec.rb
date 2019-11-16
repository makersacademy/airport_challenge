require "airport"

describe Airport do

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialize" do

    it "can override the instance variable capacity" do
      airport = Airport.new(50)
      plane = double(:plane)
      50.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end

  end

  describe "#land" do

    it "should be able to land one plane" do
      airport = Airport.new
      plane = double(:plane)
      expect(airport.land(plane)).to eq plane
    end

    it "should raise an error when the airport is full" do
      airport = Airport.new
      plane = double(:plane)
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end

  end

  describe "#take_off" do

    it "should raise an error when the weather is stormy" do
      airport = Airport.new
      weather = double(:weather, is_stormy?: true)
      expect { airport.take_off(weather.is_stormy?) }.to raise_error("The weather is stormy")
    end

    it "should raise an error when the airport is empty" do
      airport = Airport.new
      weather = double(:weather, is_stormy?: false)
      expect { airport.take_off(weather.is_stormy?) }.to raise_error("The airport is empty")
    end

    it "should be able to take off a plane when the wether is not stormy and airport not empty" do
      airport = Airport.new
      plane = double(:plane)
      weather = double(:weather, is_stormy?: false)
      airport.land(plane)
      expect(airport.take_off(weather.is_stormy?)).to eq plane
    end

  end

end
