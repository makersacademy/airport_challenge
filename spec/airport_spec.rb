require 'airport'
require 'plane'

describe Airport do
  it 'plane to land at an airport' do 
    plane = Plane.new
    airport = Airport.new 
    airport.land(plane)
    expect(airport.hangar).to include plane 
  end 
end 
