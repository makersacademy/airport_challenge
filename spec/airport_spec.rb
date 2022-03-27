require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  context "planes landing at airport" do
    before(:each) do
      allow_any_instance_of(Weather).to receive(:current_conditions).and_return :sunny
    end

    it "lands a plane at an airport" do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
    it "prevents plane from landing if weather is stormy" do 
      allow_any_instance_of(Weather).to receive(:current_conditions).and_return :stormy
      expect { airport.land(plane) }.to raise_error("Cannot proceed due to storm")
      expect(airport.planes).not_to include(plane)
      expect(plane).not_to receive(:land)
    end
    it "prevents plane from landing if airport is full" do
      new_plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(new_plane) }.to raise_error "Airport is full"
      expect(airport.planes).not_to include(new_plane)
      expect(new_plane).not_to receive(:land)
    end
  end
  context "planes taking off from airport" do
    before(:each) do
      allow_any_instance_of(Weather).to receive(:current_conditions).and_return :sunny
    end

    it "instructs plane to take off from an airport it is in" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
    end
    it "prevents take off when weather is stormy" do
      airport.land(plane)
      allow_any_instance_of(Weather).to receive(:current_conditions).and_return :stormy
      expect { airport.take_off(plane) }.to raise_error "Cannot proceed due to storm"
      expect(airport.planes).to include(plane)
      expect(plane).not_to receive(:take_off)
    end
    it "ensures that planes can only take off from airport they are in" do
      plane = Plane.new
      heathrow = Airport.new
      sydney = Airport.new
      heathrow.land(plane)
      expect { sydney.take_off(plane) }.to raise_error "This plane is not in this airport"
    end
    it "ensures that once plane takes off from airport, plane is no longer shown as being in the airport" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
    end
    it "removes the correct plane from planes when it takes off" do
      atr72 = Plane.new
      privatejet = Plane.new
      airbus = Plane.new
      airport.land(atr72)
      airport.land(privatejet)
      airport.land(airbus)
      airport.take_off(airbus)
      expect(airport.planes).not_to include(airbus)
      expect(airport.planes).to include(atr72)
      expect(airport.planes).to include(privatejet)
    end
  end
  context "airports capacity" do

    it "has a default capacity of 20 planes" do
      expect(Airport.new.capacity).to eq 20
    end
    it "can override the default capacity when requested" do
      airport50 = Airport.new(50)
      expect(airport50.capacity).to eq 50
    end
  end
end
