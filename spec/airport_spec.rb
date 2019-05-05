require 'airport'
require 'plane'

describe Airport do
  before :each do
    @airport = Airport.new
  end

  it 'is empty by default' do
    expect(@airport.planes).to be_empty
  end

  it 'can be initialized without arguments' do
    expect(Airport).to respond_to(:new).with(0).argument
  end

  it 'can be initialized with an argument' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'has a land method which requires an argument' do
    expect(@airport).to respond_to(:land).with(1).argument
  end

  it 'can be used to land at if weather is stormy' do
    allow(Weather).to receive(:stormy?) { false }
    plane = Plane.new
    @airport.land(plane)

    expect(@airport.planes).to include(plane)
    expect(@airport.planes.size).to eq(1)
  end

  it 'raises an error when a plane tries to land in stormy weather' do
    allow(Weather).to receive(:stormy?) { true }

    expect { @airport.land(Plane.new) }.to raise_error('Cannot land in stormy weather')
  end

  it 'raises an error when a plane tries to land at an airport at max capacity' do
    allow(Weather).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { @airport.land(Plane.new) }

    expect { @airport.land(Plane.new) }.to raise_error('Cannot land: Airport is full')
  end

  it 'has a take_off method which requires an argument' do
    expect(@airport).to respond_to(:take_off).with(1).argument
  end

  it 'can be used to take off from if weather is not stormy' do
    allow(Weather).to receive(:stormy?) { false }
    plane = Plane.new
    @airport.land(plane)
    @airport.take_off(plane)

    expect(@airport.planes).not_to include(plane)
    expect(@airport.planes.size).to eq(0)
  end

  it 'raises an error when a plane tries to take off in stormy weather' do
    allow(Weather).to receive(:stormy?) { true }

    expect { @airport.take_off(Plane.new) }.to raise_error('Cannot take off in stormy weather')
  end
end
