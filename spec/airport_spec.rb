require 'airport'
require 'plane'

describe Airport do

  describe "#land" do
    it "should land the plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq "Plane has been landed"
    end
  end
end
