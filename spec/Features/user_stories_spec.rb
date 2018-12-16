describe 'User Stories' do
let(:airport) { Airport.new(20, weather) }
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
      airport.land(plane)
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
    airport_2 = Airport.new(20, Weather.new)
    airport_2.land(plane)
    expect { airport.take_off(plane) }.to raise_error "Cannot take off: Plane not at this airport"
  end
end
