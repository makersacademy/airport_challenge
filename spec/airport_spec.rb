require './lib/airport'

# # As an air traffic controller 
# # So I can get passengers to a destination 
# # I want to instruct a plane to land at an airport

describe Airport do
  describe "#land" do
    it { should respond_to(:land) }

    it "should expect a plane" do 
      airport = Airport.new
      expect(airport).to respond_to(:land).with(1).argument
    end
    
    it "should land a plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.land(plane)).to eq plane
    end
  end 

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  
  describe "#takeoff" do
    it { should respond_to(:takeoff) }

    it "should expect a plane" do 
      airport = Airport.new
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it "should take off and confirm it is no longer at the airport" do
      airport = Airport.new
      plane = Plane.new
      airport.takeoff(plane)
      expect(airport.takeoff(plane)).to eq "#{plane} has taken off"
    end
  end
end
