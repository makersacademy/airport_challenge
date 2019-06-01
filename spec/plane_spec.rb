require 'plane'

describe Plane do
  it 'accepts a request to land at an airport' do
    airport = Airport.new
    expect(subject.land_at(airport)).to equal(true)
  end

  it 'adds itself to the list of planes at the airport after landing' do
    airport = Airport.new
    plane = Plane.new
    plane.land_at(airport)
    expect(airport.planes).to include(plane)
  end

  it 'accepts a request to take off from the airport' do
    airport = Airport.new
    expect(subject.take_off_from(airport)).to equal(true)
  end
end