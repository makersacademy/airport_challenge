require 'airport'
require 'plane'

describe Airport do
    it "allows a plan to land" do
        airport = Airport.new
        plane = Plane.new
        airport.land(plane)
        expect(airport.planes.first).to eq(plane)
    end

    it "allows plane to take off" do
        plane = Plane.new
        airport = Airport.new([plane])
        airport.take_off(plane)
        expect(airport.planes).to be_empty
    end
end