# test to 

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# Airport --> Land Plane

require 'airport'

describe Airport do


  describe "#land_plane" do
    airport = Airport.new

    it "should land a plane" do 
      expect(airport).to respond_to(:land_plane).with(1).argument
    end

    it "should be able to land a plane" do
      plane = double(:plane)
      expect(airport.land_plane(plane)).to eq(plane)
    end
  end


end
