require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  describe "allows passengers to get to their destination" do
    it "by landing a plane at an airport" do
      airport = Airport.new("not full", 5)
      plane = Plane.new
      ramp = airport.land_plane(plane, 0)
      expect(ramp).to include(plane)
      expect(plane.plane_status).to eq "landed"
    end

    it "by taking off a plane from an airport and confirming so" do
      airport = Airport.new("full", 5)
      plane = airport.ramps[0]
      airport.stormy = false
      expect(airport.take_off(0)).to eq plane
      expect(plane.plane_status).to eq "airborne"
      expect { airport.take_off(6) }.to raise_error "No plane at this ramp"
    end
  end

  describe "to ensure safety" do
    it "prevents landing when stormy" do
      airport = Airport.new("not full", 5)
      plane = Plane.new
      airport.stormy = true
      expect { airport.land_plane(plane, 0) }.to raise_error "Weather is stormy - cannot land"
    end

    it "prevents take-off when stormy" do
      airport = Airport.new("full", 5)
      plane = airport.ramps[0]
      airport.stormy = true
      expect { airport.take_off(0) }.to raise_error "Weather is stormy - cannot take-off"
    end

    it "prevents landing when airport is full" do
      airport = Airport.new("full", 5)
      plane = Plane.new
      expect { airport.land_plane(plane, 0) }.to raise_error "Airport is full - cannot land"
    end
  end

  describe "to allow for use at different airports" do
    it "allows the default airport capacity to be overridden" do
      airport1 = Airport.new
      airport2 = Airport.new("full", 20)
      expect(airport1.airport_capacity).to eq(CAPACITY::AIR_CAP)
      expect(airport2.airport_capacity).not_to eq(CAPACITY::AIR_CAP)
    end
  end

end
