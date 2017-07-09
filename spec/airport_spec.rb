require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'should instruct a plane to land and add to planes in airport' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(airport.plane_count).to eq 1
  end

  it 'should raise error and prevent plane landing if stormy weather' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error "All flights cancelled due to stormy weather"
  end

  it 'should instruct a plane to take off and remove from planes in airport' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(airport.plane_count).to eq 1
    airport.take_off(plane)
    expect(airport.plane_count).to eq 0
  end

  it 'should raise error and prevent take_off(plane) if stormy weather' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off(plane) }.to raise_error "All flights cancelled due to stormy weather"
  end

  it 'should have a default capacity that can be overridden' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    airport.capacity = 25
    expect(airport.capacity).to eq 25
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end

  it 'should prevent land(plane) if airport full' do
    allow(airport).to receive(:stormy?).and_return(false)
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(plane) } .to raise_error 'Airport is full'
  end

end
