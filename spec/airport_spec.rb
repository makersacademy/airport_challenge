require 'airport'
require 'plane'

describe Airport do
  #do not create instances here as these will be available everywhere
  #and will be valid for all the unit tests, best to have only
  #what you need
  
  describe "#land" do
    it "allows the plane to land" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to be_truthy
    end
  end
end