describe 'User Stories' do

  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  context 'when not stormy' do
    # As an air traffic controller
    # So planes can land safely at my airport
    # I would like to instruct a plane to land

    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So planes can take off safely from my airport
    # I would like to instruct a plane to take off
    it 'so planes can take off at airports, instruct a plane to take off' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So that I can avoid collisions
    # I want to prevent airplanes landing when my airport is full
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times do
          airport.land(plane)
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
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land when stormy' do
      # if done next line with "allow(airport).to receive(:stormy?).and_return(:true)"
      # Rspec throws a Failure/Error: 'that the object (the instance of the class)'
      # --> does not implement: stormy? <--
      # @stormy = true
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end
  end
end
