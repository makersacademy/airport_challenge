describe 'User Stories' do
  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  
  it "if plane can land instruct a plane to land at the airport" do
    airport = Airport.new(10)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

#   As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
 it "planes should take of from the airport" do
  airport = Airport.new(10)
  plane = Plane.new
  expect { airport.take_off(plane) }.not_to raise_error
 end
  # As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

it " does not let planes land when airport is full" do
  airport = Airport.new(10)
  plane = Plane.new
  10.times do
    airport.land(plane)
  end
    expect { airport.land(plane) }.to raise_error "Plane cannot land, airport full"
  end
end
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 
