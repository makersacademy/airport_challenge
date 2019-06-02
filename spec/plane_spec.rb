require "plane"

describe Plane do
    plane = Plane.new
    airport = Airport.new("Gatwick")
    airport.weather = "SUNNY"
    it "Lands a plane" do
        plane.status = "IN-AIR"
        expect(plane).to respond_to(:land)
    end
    it "gets a plane to take off" do 
        plane.status = "GROUNDED"
        expect(plane).to respond_to(:takeoff)
        expect(plane.takeoff).to eq(plane)
    end
    
    it "changes state to in-air when taking off" do
        plane.status = "GROUNDED"
        plane.takeoff
        expect(plane.status).to eq("IN-AIR")
    end
end
