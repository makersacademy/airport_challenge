require 'plane'
require 'airport'

describe Plane do
  it 'can land at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect { plane.land(airport) }.to_not raise_error
  end
  
  it 'can take off from an airport' do
    plane = Plane.new
    expect { plane.take_off }.to_not raise_error
  end
  
  it 'leaves an airport once it takes off' do
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    plane.take_off
    expect(airport.list_planes).to_not include(plane)
  end

end

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
