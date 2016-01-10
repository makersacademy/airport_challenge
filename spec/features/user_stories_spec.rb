describe 'User Stories' do

let(:airport) {Airport.new}
let(:plane) {Plane.new}
let(:weather) {Weather.new}


  context 'when not stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
    end

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport and confirm that it has landed
    it 'so planes land at airports, instruct a plane to land' do
      expect{airport.land(plane)}.not_to raise_error
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'instruct plane to take off and confirm take off' do
      airport.land(plane)
      expect{airport.take_off(plane)}.not_to raise_error
    end
  end

  context 'when stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return(true)
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    it 'take off will raise error when weather is stormy' do
      airport.land(plane)
      expect{airport.take_off(plane)}.to raise_error("Cannot take off: weather stormy")
    end
  end

end
