require 'airport'
require 'plane'

describe 'Land plane and store in airport' do
  it 'Airport traffic controller lands plane' do
    airport = Airport.new(Weather.new)
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
end
