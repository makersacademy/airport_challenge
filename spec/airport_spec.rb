require 'airport'
require 'plane'

describe Airport do

  it 'stores a landed plane in the airport capacity' do
    airport = Airport.new
    plane = Plane.new
    plane.land_plane(airport)
    expect(airport.planes_in_airport).to match_array ['plane']
  end
end
