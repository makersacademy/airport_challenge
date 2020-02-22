require 'airport'
require 'plane'

describe Airport do

  context '#land_plane'

    it "accepts planes to land" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land_plane(plane)).to eq plane
    end


  context '#take_off'

    it "allows planes to take off" do
      airport = Airport.new
      plane = Plane.new
      expect{airport.take_off}.not_to raise_error
    end
end
