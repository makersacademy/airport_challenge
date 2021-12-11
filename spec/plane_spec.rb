require 'plane'

describe Plane do
    
    it { is_expected.to respond_to(:land_plane) }
    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:check_weather) }
    it { is_expected.to respond_to(:left_airport) }

    it "plane lands at an airport, when called to" do
        plane = Plane.new
        airport = Airport.new
        expect(plane.land_plane(plane, airport)).to include(plane)
    end

    it "plane takes off from airport and is no longer in airport" do
        plane = Plane.new
        airport = Airport.new
        # expect(plane.take_off(airport)). to be_instance_of(Airport)
        expect(plane.take_off(plane, airport)).not_to include(plane)
    end

    it "plane does not land at airport if airport is full" do
        plane = Plane.new
        airport = Airport.new
        plane.land_plane(plane, airport)
        error = "PLANE NO"
        expect { plane.land_plane(plane, airport) }.to raise_error(error)
    end
   
end