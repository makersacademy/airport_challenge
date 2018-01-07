require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }

  it 'is initialized as airborne' do
    expect(plane).to be_airborne
  end

  it 'is not airborne after landing' do
    airport = Airport.new
    airport.land(plane)
    expect(plane).not_to be_airborne
  end

  it 'says it is airborne after take_off' do
    airport = Airport.new
    airport.land(plane)
    airport.take_off(plane)
    expect(plane).to be_airborne
  end

end
