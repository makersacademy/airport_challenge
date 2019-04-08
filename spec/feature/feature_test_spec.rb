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
    it 'Airport allows a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take
  # off from an airport and confirm that it is no longer in the airport
    it 'Airport allows planes to take off' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context 'when full' do
      it 'Airport does not allow planes to land' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Plane unable to land, airport full'
      end
    end
  end

  context 'when stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end
    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    it 'Aiport does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Plane unable to take off, weather is stormy'
    end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
    it 'Aiport does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Plane unable to land, weather is stormy'
    end
  end
end
