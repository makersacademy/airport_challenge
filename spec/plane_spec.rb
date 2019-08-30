require 'airport'
require 'plane'

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

describe Plane do

  describe ".grounded?" do
    it "returns true if plane has landed" do
      airport = Airport.new # Mock for airport class
      plane = Plane.new
      airport.land(plane) #Stub for Land method
      expect(plane.grounded?).to eq true
    end
  end

end
