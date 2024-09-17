describe 'User Stories' do
  let(:airport) { Airport.new(weather_reporter, 20) }
  let(:plane) { Plane.new }
  let(:weather_reporter) { WeatherReporter.new }

  context 'when not stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So planes can land safely at my airport
    # I would like to instruct a plane to land
    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So planes can take off safely from my airport
    # I would like to instruct a plane to take off
    it 'so planes take off from airports, instruct a plane to take off' do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So that I can ensure safe take off procedures
    # I want planes only to take off from the airport they are at
    it 'takes off planes only from the airport they are at' do
      airport_2 = Airport.new(weather_reporter, 20)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: plane not at this airport'
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it 'airports have a default capacity' do
      default_airport = Airport.new(weather_reporter)
      Airport::DEFAULT_CAPACITY.times do
        the_plane = Plane.new
        default_airport.land(the_plane)
      end
      expect { default_airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
    end

    # As an air traffic controller
    # So the system is consistent and correctly reports plane status and location
    # I want to ensure a flying plane cannot take off and cannot be in an airport
    it 'flying planes cannot take off' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off: plane already flying'
    end

    it 'flying planes cannot be in an airport' do
      expect { plane.airport }.to raise_error 'Plane cannot be at an airport: plane already flying'
    end

    # As an air traffic controller
    # So the system is consistent and correctly reports plane status and location
    # I want to ensure a plane that is not flying cannot land and must be in an airport
    it 'non-flying planes cannot land' do
      airport.land(plane)
      expect { plane.land(airport) }.to raise_error 'Plane cannot land: plane already landed'
    end

    it 'non-flying planes must be in an airport' do
      airport.land(plane)
      expect(plane.airport).to eq airport
    end

    # As an air traffic controller
    # So the system is consistent and correctly reports plane status and location
    # I want to ensure a plane that has taken off from an airport is no longer in that airport
    it 'taking off a plane removes it from that airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    # As an air traffic controller
    # So that I can avoid collisions
    # I want to prevent airplanes landing when my airport is full
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times do
          the_plane = Plane.new
          airport.land(the_plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
      end
    end
  end

  # As an air traffic controller
  # So that I can avoid accidents
  # I want to prevent airplanes landing or taking off when the weather is stormy
  context 'when weather is stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end

    it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
    end
  end
end
