require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  context "#land_plane" do
    it "responds to #land_plane" do
      expect(airport).to respond_to :land_plane
    end
    it "returns a landed plane" do
      plane = Plane.new
      expect(airport.land_plane(plane)).to eq plane
    end
  end

  context "#planes" do
    it "responds to #planes" do
      expect(airport).to respond_to :planes
    end
    it "saves one plane that is landed" do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes).to eq [plane]
    end
    it "can store more than one plane" do
      plane1 = Plane.new
      airport.land_plane(plane1)
      plane2 = Plane.new
      airport.land_plane(plane2)
      expect(airport.planes).to eq [plane1, plane2]
    end
  end

  context "#in_airport?" do
    it "responds to #in_airport?" do
      expect(airport).to respond_to :in_airport?
    end
    it "returns false if plane is not in the airport" do
      plane = Plane.new
      expect(airport.in_airport?(plane)).not_to be true
    end
    it "returns true if plane is in the airport" do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.in_airport?(plane)).to be true
    end
  end

  context "#takeoff" do
    it "responds to #takeoff" do
      expect(airport).to respond_to :takeoff
    end
    it "instructs a plane to takeoff" do
      plane = Plane.new
      expect(airport.takeoff(plane)).to eq plane
    end
    it "removes plane from airport after takeoff" do
      plane = Plane.new
      airport.land_plane(plane)
      puts "planes"
      puts airport.planes
      airport.takeoff(plane)
      puts airport.planes
      expect(airport.planes).not_to include(plane)
    end
  end







end
