describe 'User Stories' do
  let(:airport) { Airport.new(weather, 20) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context 'when not stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it 'instructs planes to land at an airport' do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'instructs planes to takeoff at an airport' do
      airport.land(plane)
      expect { airport.takeoff(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can ensure safe takeoff procedures
    # I want planes only to takeoff from the airport they are at
    it 'takes off planes only at airport they are at' do
      airport_2 = Airport.new(weather, 20)
      airport_2.land(plane)
      expect { airport.takeoff(plane) }.to raise_error 'Cannot takeoff plane: plane is not at this airport'
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it 'airports have a default capacity' do
      default_airport = Airport.new(weather)
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error 'Plane is unable to land: airport is full'
    end

    # As an air traffic controller
    # So the system is consistent and correctly reports plane status and location
    # I want to ensure a flying plane cannot takeoff and cannot be in an airport
    it 'flying planes cannot take off' do
      airport.land(plane)
      flying_plane = airport.takeoff(plane)
      expect { flying_plane.takeoff }.to raise_error 'Plane cannot takeoff: plane already flying'
    end

    it 'flying planes cannot be in an airport' do
      airport.land(plane)
      flying_plane = airport.takeoff(plane)
      expect { flying_plane.airport }.to raise_error 'Plane cannot be at an airport: plane is already flying'
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Plane is unable to land: airport is full'
      end
    end
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  #
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  context 'when weather is stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Warning: Storm approaching, unable to land plane'
    end

    it 'does not allow planes to takeoff' do
      expect { airport.takeoff(plane) }.to raise_error 'Warning: Storm approaching, planes are unable to takeoff'
    end
  end
end
