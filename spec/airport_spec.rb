require 'airport'

describe Airport do
  it 'can land a plane' do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane)}.not_to raise_error
  end
end