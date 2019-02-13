describe 'user stories' do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'so planes land at airports, instruct a plane to land' do
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'so planes to take off from an airport, instruct a plane to take off' do
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it ' so to prevent landing when the airport is full' do
    allow(airport).to receive(:stormy?).and_return false
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing or takeoff when weather is stormy

  it ' does not allow planes to land when stormy' do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
  end
end
