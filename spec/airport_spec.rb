require 'airport'
require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
describe Airport do

  describe "#land" do
    it "confirm plan has landed" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq("Plane has landed")
    end
  end

    describe "#take_off" do
      it "instructs a plane to take off" do
        airport = Airport.new
        plane = Plane.new
        airport.planes = [plane]
        expect(airport.take_off(plane)).to eq("Plane has taken off")
      end
    end
end
