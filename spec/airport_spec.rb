require 'airport'
require 'plane'

describe Airport do 
    airport = Airport.new(20)
    it "instructs a plane to land" do 
        expect(airport).to respond_to(:land).with(1).argument
    end 
  
    it "instructs a plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
    end 

    it "does not allow landing when at capacity" do
        plane = Plane.new
         20.times do
            airport.land(plane)
         end 
         expect { airport.land(plane) }.to raise_error "cannot land plane: airport full"

end 
end 