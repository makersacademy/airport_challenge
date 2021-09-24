require 'airport'
require 'plane'

describe Airport do
    it "returns a plane when land method is called in airport class" do
        airport = Airport.new
        plane = Plane.new
        expect(airport.land(plane)).to eq plane
    end
end