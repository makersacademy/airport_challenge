require 'plane'
require 'airport'

describe Plane do

  it 'can land at an airport' do
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    expect(airport.planes[0]).to eq(plane)
  end

  it 'can take off from an airport' do
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    plane.takeoff
    expect(airport.planes).to be_empty
  end

end
