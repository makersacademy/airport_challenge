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

  it 'plane cannot land if airport is full' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { subject.land(airport) }
    expect(subject.land(airport)).to raise_error("airport is full")
  end
end