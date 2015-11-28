
describe 'user stories'do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed
context 'airport'do
  it 'instructs a plane to land'do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end
  it 'instructs a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
  end
end

context 'plane' do
  it 'confirms that plane has landed' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(plane.landed?).to eq true
  end
  it 'confirms plane is in the air' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.in_air?).to eq true
  end
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
