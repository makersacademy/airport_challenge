require 'plane'

describe Plane do
    
    describe "Plane lands." do
        it "Plane returns a status of 'down' when it successfully lands." do
            airport = Airport.new
            allow(airport).to receive(:airport_open?){true}           #This removes random weather factor.
            plane = Plane.new
            airport.land_plane(plane)
            expect(plane).to have_attributes(:plane_status => "down")
        end    
    end
    
    describe "Plane takes-off." do
        it "Plane returns a status of 'up' when it successfully takes-off." do
            airport = Airport.new
            allow(airport).to receive(:airport_open?){true}         #This removes random weather factor.
            plane = Plane.new
            airport.land_plane(plane)
            airport.take_off(plane)
            expect(plane).to have_attributes(:plane_status => "up")
        end
    end  
     
end