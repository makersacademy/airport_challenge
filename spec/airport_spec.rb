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
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end

  end

  describe "#land" do

    context "when the weather is stormy" do
      let(:weather) { double(:weather, stormy?: true) }
      let(:airport) { Airport.new(1, weather) }

      it "should raise an error" do
        plane = double(:plane)
        expect { airport.land(plane) }.to raise_error("The weather is stormy")
      end

    end

    context "when the weather is not stormy" do
      let(:weather) { double(:weather, stormy?: false) }
      let(:airport) { Airport.new(1, weather) }

      it "should be able to land one plane" do
        plane = double(:plane, landed?: false, land: true)
        expect(airport.land(plane)).to eq plane
      end

      it "should raise an error if the airport is full" do
        plane = double(:plane, landed?: false, land: true)
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error("The airport is full")
      end

      it "should raise an error if the plane has already landed" do
        plane = double(:plane, landed?: true)
        expect { airport.land(plane) }.to raise_error("Plane already landed")
      end

    end

  end

  describe "#take_off" do

    context "when the weather is stormy" do
      let(:weather) { double(:weather, stormy?: true) }
      let(:airport) { Airport.new(1, weather) }

      it "should raise an error" do
        plane = double(:plane)
        expect { airport.take_off(plane) }.to raise_error("The weather is stormy")
      end

    end

    context "when the weather is not stormy" do
      let(:weather) { double(:weather, stormy?: false) }
      let(:airport) { Airport.new(1, weather) }

      it "should be able to take off a plane" do
        plane = double(:plane, landed?: false, land: true, take_off: false)
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it "should raise an error if the airport is empty" do
        plane = double(:plane)
        expect { airport.take_off(plane) }.to raise_error("The airport is empty")
      end

      it "should raise an error if the plane has not landed in this airport" do
        plane = double(:plane, landed?: false, land: true)
        airport.land(plane)
        # First two lines included to avoid raising the error "The airport is empty"
        different_plane = double(:plane)
        expect { airport.take_off(different_plane) }.to raise_error("Plane not landed in this airport")
      end

    end

  end

end
