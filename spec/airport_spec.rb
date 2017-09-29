require 'airport'
require 'plane'

describe Airport do

  it 'returns the plane in the airport' do
    expect(Airport.new).to respond_to :planes
  end

  it 'stores landed planes' do
    plane, airport = Plane.new, Airport.new
    plane.land_at(airport)
    expect(airport.planes).to eq plane
  end

end