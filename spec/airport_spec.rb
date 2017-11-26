require 'airport'

describe Airport do
  let(:plane) { double(:my_plane, landing: true, taking_off: true, flying: true) }
  subject(:airport) { described_class.new }

  it "should have a variable capacity" do
    airport = Airport.new 50
    allow(airport).to receive(:stormy?) { false }
    50.times { airport.land(plane) }
    expect { airport.try_to_land(plane) }.to raise_error "Airport currently full"
  end

  it "should get weather information" do
    expect(airport).to respond_to(:weather, :stormy?)
  end

  describe "#land" do

    it "should land a plane" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.planes.include?(plane)).to be true
    end

  end

  describe "#try_to_land" do

    it "should not land a plane if the weather is stormy" do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.try_to_land(plane) }.to raise_error "Currently unsafe to land plane"
    end

    it "should not land a plane is the airport is full" do
      allow(airport).to receive(:stormy?) { false }
      30.times { airport.try_to_land(plane) }
      expect { airport.try_to_land(plane) }.to raise_error "Airport currently full"
    end

    it "should not attempt to land a plane which is already landed" do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:flying) { false }
      expect { airport.try_to_land(plane) }.to raise_error "This plane is already landed"
    end

  end

  describe "#takeoff" do

    it "should make a plane take off" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(plane).to receive(:flying) { false }
      airport.try_to_takeoff(plane)
      expect(airport.planes.include?(plane)).to be false
    end

  end

  describe "#try_to_takeoff" do

    it "should not let a plane take off if the weather is stormy" do
      airport.land(plane)
      allow(plane).to receive(:flying) { false }
      allow(airport).to receive(:stormy?) { true }
      expect { airport.try_to_takeoff(plane) }.to raise_error "Currently unsafe for plane to take off"
    end

    it "should not attempt to takeoff a plane which is already flying" do
      allow(airport).to receive(:stormy?) { false }
      expect { airport.try_to_takeoff(plane) }.to raise_error "Plane is already in the air"
    end

    it "should not let a plane which isn't in the airport take off from that airport" do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:flying) { false }
      expect { airport.try_to_takeoff(plane) }.to raise_error "This plane is not currently in the airport and so cannot take off"
    end

  end
end
