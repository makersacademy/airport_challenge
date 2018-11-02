require 'airport'
require 'plane'

describe Airport do
    plane = Plane.new
    airport = Airport.new

  it 'instructs a plane to land' do
    airport.land(plane)
    expect(airport.instance_variable_get(:@hangar)).to include(plane)
  end
  it 'instructs a plane to take off' do
    airport.take_off(plane)
    expect(airport.instance_variable_get(:@hangar)).not_to include(plane)
  end
end
