require "airport"

describe Airport do

  let(:weather)     { double :weather, stormy?: false }
  let(:plane)       { double :plane, land: nil, take_off: nil, landed: nil }
  subject(:airport) { described_class.new(Airport::DEFAULT_CAPACITY, weather) }

  describe "capacity" do
    it "should ensure that the default capacity is set" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should allow the user to set the capacity" do
      expect(Airport.new(20, weather).capacity).to eq 20
    end
  end

  describe "#land" do
    before(:each) do
      airport.land(plane)
    end

    it "should raise an error if the plane is already landed" do
      allow(plane).to receive(:landed).and_return(true)
      expect { airport.land(plane) }.to raise_error("Plane is already landed")
    end

    it "should allow the plane to land and stay landed in the airport" do
      expect(airport.planes).to include(plane)
    end

    it "should raise an error if the aiport is full" do
      airport = Airport.new(0, weather)
      expect { airport.land(plane) }.to raise_error("Airport full")
    end

    it "should raise an error if the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error("Bad weather - unable to land")
    end
  end

  describe "#take_off" do
    before(:each) do |spec|
      unless spec.metadata[:skip_before]
        airport.planes << plane
      end
    end

    it "should raise an error if the plane is not in the aiport", :skip_before do
      expect { airport.take_off(plane) }.to raise_error("Plane not in airport")
    end

    it "should allow a plane to take off and leave the airport" do
      airport.take_off(plane)
      expect(airport.planes.include?(plane)).to eq false
    end

    it "should raise an error if the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("Bad weather - unable to take off")
    end
  end

end
