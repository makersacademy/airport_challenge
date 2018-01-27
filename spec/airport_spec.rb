require 'airport'
require 'plane'

describe Airport do

  describe "#land" do
    it "lands the planes" do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq [plane]
    end
  end


end
