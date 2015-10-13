describe 'Airport Challenge' do
  let(:weather) { Weather.new }
  before { allow(weather).to receive(:stormy?).and_return false }
  subject(:airport) { Airport.new(weather: weather) }
  let(:plane) { Plane.new }

  specify 'a pilot can land a plane at an airport' do
    airport.land(plane)
  end

  specify 'a pilot can take off from an airport' do
    airport.land(plane)
    airport.take_off(plane)
  end

  specify 'a plane cannot be landed if the airport is full' do
    airport.land(plane)
    message = 'Cannot land since airport is full'
    expect { airport.land(Plane.new) }.to raise_error message
  end

  context 'airport with capacity 2' do
    subject(:airport) { Airport.new(capacity: 2, weather: weather)}
    specify 'third plane cannot land at an airport with capacity 2' do
      airport.land(plane)
      airport.land(Plane.new)
      message = 'Cannot land since airport is full'
      expect { airport.land(Plane.new) }.to raise_error message
    end
  end

  context 'variable weather conditions' do
    let(:weather) { Weather.new }
    subject(:airport) { Airport.new(weather: weather) }

    specify 'a plane cannot land when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return true
      message = 'Unable to land due to stormy weather'
      expect { airport.land(plane) }.to raise_error message
    end

    specify 'a plane can land after storm has cleared' do
      allow(weather).to receive(:stormy?).and_return true
      message = 'Unable to land due to stormy weather'
      expect { airport.land(plane) }.to raise_error message
      allow(weather).to receive(:stormy?).and_return false
      expect { airport.land(plane) }.not_to raise_error
    end

    specify 'a plane cannot take off when weather is stormy' do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return true
      message = 'Unable to take off due to stormy weather'
      expect { airport.take_off(plane) }.to raise_error message
    end

    specify 'a plane can take off after storm has cleared' do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return true
      message = 'Unable to take off due to stormy weather'
      expect { airport.take_off(plane) }.to raise_error message
      allow(weather).to receive(:stormy?).and_return false
      expect { airport.take_off(plane) }.not_to raise_error
    end
  end

  specify 'a plane can only take off from an airport it is at' do
    message = 'The plane is not currently landed at this airport'
    expect{ airport.take_off(plane) }.to raise_error message
  end
end
