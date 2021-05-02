describe "features" do 
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'instructs a plane to land so passengers get to a destination' do
    airport = Airport.new
    plane = Plane.new
    expect {airport.land(plane)}.not_to raise_error
  end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
 it 'instructs a plane to take off so passengers get to a destination' do
    airport = Airport.new
    plane = Plane.new
    expect {airport.take_off(plane)}.not_to raise_error
 end 
end