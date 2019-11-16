# test to 

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# Airport --> Land Plane

require 'airport'

describe Airport do
  airport = Airport.new

  describe "initialize" do 
    it "should have a default capacity of 10 planes if no argument is entered" do
      expect(Airport::DEFAULT_CAPACITY).to eq(10)
    end

    it "should have a default capacity of 20 planes if 20 is entered as an argument" do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end
  end
  
  describe "#land_plane" do

    let!(:plane) { double(:plane) }

    it "should have a land_plane method" do 
      expect(airport).to respond_to(:land_plane).with(1).argument
    end

    it "should be able to land a plane" do
      expect(airport.land_plane(plane)).to eq([plane])
    end

    it "should raise an error if trying to land a plane when the airport is at capacity" do
      expect { 11.times { subject.land_plane(plane) } }.to raise_error RuntimeError
    end

    it "should be able to land 10 planes if user does not specify a capacity" do
      expect { 10.times { subject.land_plane(plane) } }.to_not raise_error
    end
  end

  describe "#take_off" do
    it "should allow planes to take off" do
      plane = double(:plane)
      subject.land_plane(plane)
      expect(subject.take_off).to eq("Plane has taken-off")
    end

    it "should raise an error if instructing a plane to take off when there are no planes to take off" do 
      expect { subject.take_off }.to raise_error RuntimeError
    end
  end

end
