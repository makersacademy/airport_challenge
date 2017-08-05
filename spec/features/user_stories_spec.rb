
describe "user_stories" do
    
# As an air traffic controller 
#So I can get passengers to a destination 
#I want to instruct a plane to land at an airport
  it "So passengers can get to destination I instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land_plane(plane) }.not_to raise_error
  end

#As an air traffic controller 
#So I can get passengers on the way to their destination 
#I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "So passengers can get on their way" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.plane_left_airport?(plane.take_off) }.not_to raise_error
  end
#As an air traffic controller 
#To ensure safety 
#I want to prevent takeoff when weather is stormy 


#As an air traffic controller 
#To ensure safety 
#I want to prevent landing when weather is stormy 


#As an air traffic controller 
#To ensure safety 
#I want to prevent landing when the airport is full


#As the system designer
#So that the software can be used for many different airports
#I would like a default airport capacity that can be overridden as appropriate



end

