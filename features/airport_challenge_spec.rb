describe 'Airport Challenge' do
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  specify 'a pilot can land a plane at an airport' do
    airport.land(plane)
  end

  specify 'a pilot can take off from an airport' do
    airport.land(plane)
    airport.take_off(plane)
  end

  specify 'a plane cannot be landed if the airport is full' do
    plane2 = Plane.new
    airport.land(plane)
    message = 'Cannot land since airport is full'
    expect { airport.land(plane2) }.to raise_error message
  end

  context 'airport with capacity 2' do
    subject(:airport) { Airport.new(capacity: 2)}
    specify 'two planes can land at an airport with capacity 2' do
      plane2 = Plane.new
      airport.land(plane)
      message = 'Cannot land since airport is full'
      expect { airport.land(plane2) }.not_to raise_error message
    end
  end

  specify 'a plane cannot land when weather is stormy' do
    airport.report_storm
    message = 'Unable to land due to stormy weather'
    expect { airport.land(plane) }.to raise_error message
  end

  specify 'a plane cannot take off when weather is stormy' do
    airport.land(plane)
    airport.report_storm
    message = 'Unable to take off due to stormy weather'
    expect { airport.take_off(plane) }.to raise_error message
  end

  specify 'a plane can only take off from an airport it is at' do
    message = 'The plane is not currently landed at this airport'
    expect{ airport.take_off(plane) }.to raise_error message
  end
end
