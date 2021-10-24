require 'airport'
#require 'plane'

describe "User stories" do 
    it "allow planes to land at airport" do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
end 
   it "so planes can take off from airports, instruct a plane to take off" do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
   
end 
   it "prevents collisions by restricting number of planes that can land" do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do 
        airport.land(plane)
    end 
    expect { airport.land(plane) }.to raise_error "cannot land plane: airport full"
end 
end

