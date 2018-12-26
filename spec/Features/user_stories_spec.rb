describe 'User Stories' do
  let(:airport) { Airport.new(weather, 20) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
 # As an air traffic controller
 # So planes can safely land at my airport
 # I would like to instruct a plane to land
  it 'so an airplane can land safely' do
    allow(weather).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'allows a plane to take off' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it 'prevents a plane from landing if airport is full' do
    allow(weather).to receive(:stormy?).and_return false
    20.times do
      the_plane = Plane.new
      airport.land(the_plane)
    end
    expect { airport.land(plane) }.to raise_error "Airport Full"
  end

  it 'does not allow plane to land when it is stormy' do
    allow(weather).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Cannot land plane: Weather stormy"
  end

  it 'does not allow planes to take off when it is stormy' do
    allow(weather).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error "Cannot take off: Weather stormy"
  end

  it 'allows a plane to only take off from the airport they are at' do
    allow(weather).to receive(:stormy?).and_return false
    airport_2 = Airport.new(weather, 20)
    airport_2.land(plane)
    expect { airport.take_off(plane) }.to raise_error "Cannot take off: Plane not at this airport"
  end

  it 'allows an airport\'s default capacity to be overwritten' do
    default_airport = Airport.new(weather)
    allow(weather).to receive(:stormy?).and_return false
    Airport::DEFAULT_CAPACITY.times do
      the_plane = Plane.new
      default_airport.land(the_plane)
     end
    expect { default_airport.land(plane) }.to raise_error "Airport Full"
  end

  it 'does not allow a flying plane to take off' do
    allow(weather).to receive(:stormy?).and_return false

    expect { plane.take_off }.to raise_error "Cannot take off: Plane already in air"
  end

  it 'returns the plane that took off' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
  end

  it 'flying planes cannot be in an airport' do
    allow(weather).to receive(:stormy?).and_return false
    expect { plane.airport }.to raise_error "Plane not at airport: Plane already in air"
  end

  it 'planes not flying cannot land' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect { plane.land(airport) }.to raise_error "Plane cannot land: Plane already landed at airport"
  end

  it 'planes not flying must be in an airport' do
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(plane.airport).to eq airport
  end

end
