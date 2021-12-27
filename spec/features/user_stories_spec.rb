describe "User stories/Feature tests" do
    # set up a double for the plane class
    # let(:plane) { Plane.new }

    it "so that planes land at airport, instruct a plane to land" do 
        airport = Airport.new(20)
        plane = Plane.new 
        expect { airport.land(plane) }.not_to raise_error 
    end 
    

    it "instruct a plane to take off from airport and confirm that it is no longer in the airport" do 
        airport = Airport.new(20)
        plane = Plane.new 
        expect { airport.take_off(plane) }.not_to raise_error
    end 

    it "does not allow planes to land when airport is full" do 
        airport = Airport.new(20)
        plane = Plane.new
        20.times do 
            airport.land(plane)
        end 
        expect { airport.land(plane) }.to raise_error "Airport is full, cannot land the plane"
    end 


    it "the airport a default capacity" do
        plane = Plane.new
        airport = Airport.new(plane)
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Airport is full, cannot land the plane"
    end 

end 