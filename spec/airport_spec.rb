require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}

  context "landing planes" do
    it "instructs planes to land" do
      expect(airport).to respond_to :land_plane
    end
    it "airport stores the plane after landing" do
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end
    it "raises an error when airport is full" do
      10.times{ airport.planes << Plane.new }
      expect{ airport.land_plane(Plane.new) }.to raise_error "Airport is full"
    end
  end

  context "checking planes are in the airport" do
    it "returns false if plane is not in the airport" do
      expect(airport.in_airport?(plane)).to be false
    end
    it "returns true if plane is in the airport" do
      airport.land_plane(plane)
      expect(airport.in_airport?(plane)).to be true
    end
  end

  context "planes taking off" do
      let(:plane_double) {double :plane_double}
    it "instructs a plane to take off" do
      allow(airport).to receive :takeoff
      airport.takeoff(plane)
    end
    it "removes the correct plane from the airport" do
      airport.planes << plane_double
      airport.takeoff(plane_double)
      expect(airport.planes).not_to include plane_double
    end
    it "raises an error when instructing plane not in airport to takeoff" do
      expect{ airport.takeoff(plane) }.to raise_error "Plane cannot takeoff because it is not in the airport"
    end
  end

  context "airport capacity" do
    it "has a capacity" do
      expect(airport).to respond_to :capacity
    end
    it "capacity can be set" do
      expect(Airport.new(20).capacity).to be 20
    end
    it "has a default capacity" do
      default_capacity = Airport::DEFAULT_CAPACITY
      expect(airport.capacity).to be (default_capacity)
    end
  end







end
