# test to 

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# Airport --> Land Plane

require 'airport'

describe Airport do

  # it "should have a default capacity of 10 planes" do
  #   expect(Airport).to eq(10)
  # end
  airport = Airport.new
  describe "#land_plane" do
    it "should have a land_plane method" do 
      expect(airport).to respond_to(:land_plane).with(1).argument
    end

    it "should be able to land a plane" do
      plane = double(:plane)
      expect(airport.land_plane(plane)).to eq(plane)
    end
  end

  describe "#take_off" do
    it "should allow planes to take off" do
      plane = double(:plane)
      airport.land_plane(plane)
      expect(airport.take_off).to eq("Plane has taken-off")
    end

    it "should raise an error if instructing a plane to take off when there are no planes to take off" do 
      expect { airport.take_off }.to raise_error RuntimeError
    end
  end

    # it "should allow the user to overide the default capacity" do
    # end

    # it "should be able to land 5 planes if user determined capacity is 5" do
    # end

    # it "should raise an error if trying to land a plane when the airport is at capacity" do
    # end
end
