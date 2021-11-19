require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }

  it 'lands at airport' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes.length).to be(1)
  end

  it 'departs from airport' do
    airport = Airport.new
    subject.land(airport)
    subject.depart(airport)
    expect(airport.planes.length).to be (0)
  end

  it 'cannot land if airport is full' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { subject.land(airport) }
    expect{ subject.land(airport) }.to raise_error("airport is full")
  end

  it 'cannot land if weather is stormy' do
    airport = Airport.new
    expect { subject.depart(airport) }.to raise_error("weather is stormy")
  end
end