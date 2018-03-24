require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  it 'stores a landed plane in the airport capacity' do
    airport = Airport.new
    plane = Plane.new
    plane.land_plane(airport)
    expect(airport.planes_in_airport).to match_array ['plane']
  end

  describe '#takeoff'
  it 'can be instructed to let a plane takeoff' do
    expect(airport).to respond_to(:takeoff)
  end

end
