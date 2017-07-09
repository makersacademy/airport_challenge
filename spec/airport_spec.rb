require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new("Heathrow") }
  let(:plane) { Plane.new }

  it 'should instruct a plane to land and add to planes in airport' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(airport.plane_count).to eq Airport::DEFAULT_PLANES + 1
  end

  it 'should raise error and prevent plane landing if stormy weather' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error "All flights cancelled due to stormy weather"
  end

  it 'should instruct a plane to take off and remove from planes in airport' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(airport.plane_count).to eq Airport::DEFAULT_PLANES + 1
    airport.take_off(plane)
    expect(airport.plane_count).to eq Airport::DEFAULT_PLANES
  end

  it 'should raise error and prevent a plane taking off if stormy weather' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "All flights cancelled due to stormy weather"
  end

  it 'should have a default capacity that can be overridden' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    airport.capacity = 25
    expect(airport.capacity).to eq 25
    airport = Airport.new("Gatwick", 30)
    expect(airport.capacity).to eq 30
  end

  it 'should prevent land(plane) if airport full' do
    airport = Airport.new("Gatwick", 10, 10)
    allow(airport).to receive(:stormy?).and_return(false)
    expect { airport.land(plane) } .to raise_error 'Airport is full'
  end

  it 'should raise error if initialized with more planes than capacity' do
    expect { Airport.new("Gatwick", 10, 25) }.to raise_error "no_of_planes exceeds capacity"
  end

end
