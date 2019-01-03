describe 'User Stories' do
  let(:airport) { Airport.new(20, weather) }
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
      airport_2 = Airport.new(20, weather)
      airport_2.land(plane)
      expect { airport.takeoff(plane) }.to raise_error 'Cannot takeoff plane: plane is not at this airport'
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
