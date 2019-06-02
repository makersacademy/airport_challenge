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

    it "raises err when plane is grounded and a land is attempted" do
        plane.status = "GROUNDED"
        expect {plane.land}.to raise_exception "Plane is already grounded"
    end

    it "raises err when plane is airbourne and takeoff is attempted" do
        plane.status = "IN-AIR"
        expect {plane.takeoff}.to raise_exception "Plane is already airbourne"
    end
end
