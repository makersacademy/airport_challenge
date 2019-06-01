require "plane"

describe Plane do
    plane = Plane.new
    it "Lands a plane" do
        expect(plane).to respond_to(:land)
    end
    it "gets a plane to take off" do 
        plane.weather = "GOOD"
        expect(plane).to respond_to(:takeoff)
        expect(plane.takeoff).to eq("Plane is in the air")
    end
    it "throws weather warning error is conditions are poor" do
        plane.weather = "POOR"
        expect {plane.takeoff}.to raise_exception "Conditions are unfavourable"
    end
    it "throws exception when weather conditions are poor for landing" do
        plane.weather = "POOR"
        expect {plane.land}.to raise_exception "Conditions are unfavourable"
    end

end
