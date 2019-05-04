require 'airport'
require 'plane'

describe Airport do
  it 'lists docked planes' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.planes).to eq([plane])
  end
end
