require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}

  context "landing planes" do
    it "instructs planes to land" do
      allow(airport).to receive :land_plane
      airport.land_plane(plane)
    end
    it "landed plane is returned" do
      expect(airport.land_plane(plane)).to eq plane
    end
    it "airport stores the plane after landing" do
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end
  end

  context "#planes" do
    it "can store more than one plane" do
      plane1 = Plane.new
      airport.land_plane(plane1)
      plane2 = Plane.new
      airport.land_plane(plane2)
      expect(airport.planes).to eq [plane1, plane2]
    end
  end

  context "checking planes are in the airport" do
    it "responds to #in_airport?" do
      expect(airport).to respond_to :in_airport?
    end
    it "returns false if plane is not in the airport" do
      expect(airport.in_airport?(plane)).to be false
    end
    it "returns true if plane is in the airport" do
      airport.land_plane(plane)
      expect(airport.in_airport?(plane)).to be true
    end
  end

  context "planes taking off" do
    it "instructs a plane to take off" do
      allow(airport).to receive :takeoff
      airport.takeoff(plane)
    end
    it "removes plane from airport after takeoff" do
      airport.land_plane(plane)
      airport.takeoff(plane)
      expect(airport.planes).not_to include(plane)
    end
  end







end
