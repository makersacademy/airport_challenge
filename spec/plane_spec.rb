require 'airport'
require 'weather'

describe Plane do
  subject(:airport) { Airport.new }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }

  it 'is initialized as airborne' do
    expect(plane).to be_airborne
  end

  it 'is not airborne after landing' do
    airport.land(plane)
    expect(plane).not_to be_airborne
  end

  it 'says it is airborne after take_off' do
    airport.land(plane)
    airport.take_off(plane)
    expect(plane).to be_airborne
  end

end
