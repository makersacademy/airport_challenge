require 'airport'
require 'plane'

describe Airport do
  airport = Airport.new
  plane = Plane.new
  
  before do
    allow(airport).to receive(:stormy?).and_return(true)
  end

  it 'doesn\'t allow a plane to take off if weather is stormy' do
    expect(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off }.to raise_error 'Too stormy to take off'
  end

  it 'doesn\'t allow a plane to land if weather is stormy' do
    expect(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error 'Too stormy to land'
  end

  before do
    airport = Airport.new
    plane = Plane.new
    allow(subject).to receive(:stormy?).and_return(false)
  end

  it 'allows a plane to land at the airport' do
    expect(subject.land(plane)).to eq plane
  end

  it 'allows a plane to take off from the airport' do
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'doesn\'t allow a plane to land if airport capacity reached' do
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'No capacity at airport'
  end

  it 'default plane capacity can be overwritten' do
    airport = Airport.new(1)
    expect(airport.plane_capacity).to eq 1
  end
end
