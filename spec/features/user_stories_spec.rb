describe 'User Stories' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  context 'when weather is not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport and confirm that it has landed
    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end


    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'so planes take off from airports, instruct a plane to take off' do
      expect { airport.take_off(plane) }.not_to raise_error
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  context 'when weather is stormy' do # when(!) signals potential use of a context block
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'prevents takeoff of planes' do
      expect { airport.take_off(plane) }.to raise_error 'Unable to take off: Weather is stormy'
    end

    it 'prevents landing of planes' do
      expect { airport.land(plane) }.to raise_error 'Unable to land: Weather is stormy'
    end
    
  end
end
