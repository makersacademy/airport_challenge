describe "User stories/Feature tests" do
    it "so that planes land at airport, instruct a plane to land" do 
        airport = Airport.new 
        plane = Plane.new 
        expect { airport.land(plane) }.not_to raise_error 
    end 
end 