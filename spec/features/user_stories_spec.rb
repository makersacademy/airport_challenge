describe 'user stories' do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
    it 'so planes land at airports, instruct a plane to land' do
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

    context 'when airport is full' do
      it 'so to prevent landing when the airport is full' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
      end
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing or takeoff when weather is stormy
  context 'when weather is stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land when stormy' do
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end

    it 'does not allow planes to take off when stormy' do
      expect { airport.take_off(plane) }.to raise_error "Cannot take off plane: weather is stormy"
    end
  end
end
