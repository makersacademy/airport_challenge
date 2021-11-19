require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }

  it 'plane lands at airport' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes.length).to be(1)
  end

  it 'plane departs from airport' do
    airport = Airport.new
    subject.land(airport)
    subject.depart(airport)
    expect(airport.planes.length).to be (0)
  end
end