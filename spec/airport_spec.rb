require 'airport'
require 'plane'

describe Airport do
  it 'lists number of docked planes' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.planes).to eq(1)
  end
end
