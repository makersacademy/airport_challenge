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

  it 'can be used to land planes up to capacity if airport is default' do
    allow(Weather).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { @airport.land(Plane.new) }

    expect(@airport.planes.size).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'raises an error when a plane tries to land at an airport at default max capacity' do
    allow(Weather).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { @airport.land(Plane.new) }

    expect { @airport.land(Plane.new) }.to raise_error('Cannot land: Airport is full')
  end

  it 'can be used to land planes up to capacity if airport is custom' do
    allow(Weather).to receive(:stormy?) { false }
    custom_capacity = Airport::DEFAULT_CAPACITY + 5
    airport = Airport.new(custom_capacity)
    custom_capacity.times { airport.land(Plane.new) }

    expect(airport.planes.size).to eq(custom_capacity)
  end

  it 'raises an error when a plane tries to land at an airport at custom max capacity' do
    allow(Weather).to receive(:stormy?) { false }
    custom_capacity = Airport::DEFAULT_CAPACITY + 5
    airport = Airport.new(custom_capacity)
    custom_capacity.times { airport.land(Plane.new) }

    expect { airport.land(Plane.new) }.to raise_error('Cannot land: Airport is full')
  end

  it 'has a take_off method which requires an argument' do
    expect(@airport).to respond_to(:take_off).with(1).argument
  end

  it 'raises an error when a plane tries to take off from an airport it is not at' do
    expect { @airport.take_off(Plane.new) }.to \
    raise_error('Cannot take off: Plane is not at Airport')
  end

  it 'can be used to take off from if weather is not stormy' do
    allow(Weather).to receive(:stormy?) { false }
    plane = Plane.new
    @airport.planes << plane
    @airport.take_off(plane)

    expect(@airport.planes).not_to include(plane)
    expect(@airport.planes.size).to eq(0)
  end

  it 'raises an error when a plane tries to take off in stormy weather' do
    plane = Plane.new
    @airport.planes << plane
    allow(Weather).to receive(:stormy?) { true }

    expect { @airport.take_off(plane) }.to raise_error('Cannot take off in stormy weather')
  end
end
