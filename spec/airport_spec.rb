require "airport"

describe Airport do

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialize" do

    it "should be able to override the instance variable capacity" do
      weather = double(:weather, stormy?: false)
      airport = Airport.new(10, weather)
      10.times do
        plane = double(:plane, landed?: false, land: true)
        airport.land(plane)
      end
      plane = double(:plane, landed?: false)
      message = "Cannot land as the airport is full"
      expect { airport.land(plane) }.to raise_error(message)
    end

  end

  describe "#land" do

    context "when the weather is stormy" do
      let(:weather) { double(:weather, stormy?: true) }
      let(:airport) { Airport.new(1, weather) }

      it "should raise an error" do
        plane = double(:plane)
        message = "Cannot land due to stormy weather"
        expect { airport.land(plane) }.to raise_error(message)
      end

    end

    context "when the weather is not stormy" do
      let(:weather) { double(:weather, stormy?: false) }
      let(:airport) { Airport.new(1, weather) }

      it "should be able to land one plane and confirm it is now in the airport" do
        plane = double(:plane, landed?: false, land: true)
        expect(airport.land(plane)).to eq airport
      end

      it "should raise an error if the airport is full" do
        plane = double(:plane, landed?: false, land: true)
        airport.land(plane)
        message = "Cannot land as the airport is full"
        expect { airport.land(plane) }.to raise_error(message)
      end

      it "should raise an error if the plane has already landed" do
        plane = double(:plane, landed?: true)
        message = "Cannot land as the plane has already landed"
        expect { airport.land(plane) }.to raise_error(message)
      end

    end

  end

  describe "#take_off" do

    context "when the weather is stormy" do
      let(:weather) { double(:weather, stormy?: true) }
      let(:airport) { Airport.new(1, weather) }

      it "should raise an error" do
        plane = double(:plane)
        message = "Cannot take off due to stormy weather"
        expect { airport.take_off(plane) }.to raise_error(message)
      end

    end

    context "when the weather is not stormy" do
      let(:weather) { double(:weather, stormy?: false) }
      let(:airport) { Airport.new(1, weather) }

      it "should be able to take off a plane and confirm it is no longer in the airport" do
        plane = double(:plane, landed?: false, land: true, take_off: false, inside?: true)
        airport.land(plane)
        expect(airport.take_off(plane)).to eq airport
      end

      it "should raise an error if the plane has not landed in this airport" do
        plane = double(:plane, inside?: false)
        message = "Cannot take off as plane not landed"
        expect { airport.take_off(plane) }.to raise_error(message)
      end

    end

  end

end
