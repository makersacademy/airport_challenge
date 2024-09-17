require 'airport'
require 'plane'
require 'weather'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

describe 'air traffic controller' do
  it 'instructs a plane to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq("plane has landed")
  end

  it 'instructs a plane to take off and then confirm no longer at airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.take_off(plane)).to eq("plane has taken off")
  end

end
