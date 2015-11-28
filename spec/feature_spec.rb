
describe 'user stories'do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed
  it 'instructs a plane to land'do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq true
  end

  it 'confirms that plane has landed' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(plane.landed?).to eq true
  end
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

end
