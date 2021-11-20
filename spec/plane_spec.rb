require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }

  it 'lands at airport' do
    airport = Airport.new
    allow(airport).to receive(:is_stormy?) { false }
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
    expect { subject.land(airport) }.to raise_error("airport is full")
  end

  it 'cannot depart when weather is stormy' do
    airport = Airport.new
    allow(airport).to receive(:is_stormy?) { true }
    expect { subject.depart(airport) }.to raise_error("weather is stormy")
  end

  it 'cannot land when weather is stormy' do
    airport = Airport.new
    allow(airport).to receive(:is_stormy?) { true }
    expect { subject.land(airport) }.to raise_error("weather is stormy")
  end

  it 'can only depart from airports they are in' do
    airport_1 = Airport.new
    airport_2 = Airport.new
    subject.land(airport_1)
    expect { subject.depart(airport_2) }.to raise_error("plane is not at that airport")
  end

  it 'cannot take off when flying' do
    airport = Airport.new
    expect { subject.depart(airport) }.to raise_error("plane is already flying")
  end

  it 'cannot land when landed' do
    airport = Airport.new
    airport.land(subject)
    expect { subject.land(airport) }.to raise_error("plane has already landed")
  end
end