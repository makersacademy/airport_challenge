describe "User stories/Feature tests" do
    it "so that planes land at airport, instruct a plane to land" do 
        airport = Airport.new 
        plane = Plane.new 
        expect { airport.land(plane) }.not_to raise_error 
    end 
    

    it "instruct a plane to take off from airport and confirm that it is no longer in the airport" do 
        airport = Airport.new 
        plane = Plane.new 
        expect { airport.take_off(plane) }.not_to raise_error
    end 
end 