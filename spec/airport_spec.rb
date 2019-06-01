require "plane"
require "airport"

describe Airport do
    airport = Airport.new

    it "throws expection when airport is full and trying to land" do
        plane = Plane.new  
        plane.weather = "GOOD"
        airport.spaces = 0
        expect {airport.taxi}.to raise_exception "No space for new aircraft"
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    it "initializes a default airport capacity" do
        airport = Airport.new
        expect(airport.spaces).to eq(3)
    end
end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 