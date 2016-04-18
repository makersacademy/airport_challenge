require 'airport'

describe Airport do

  let(:airport) { subject }
  let(:plane) { spy(:plane) }
  let(:plane_1) { spy(:plane) }
  let(:weather) { double(:weather, stormy?: false)}

  subject {described_class.new(20, weather)}

  describe '#land' do

    context 'if the weather is not stormy' do

      it 'instructs the plane to land if hangar is not full' do
        airport.land(plane)
        expect(plane).to have_received(:land)
      end

      it 'confirms the plane has landed' do
        airport.land(plane)
        expect(airport.hangar).to include plane
      end

      it 'raise an error if the hangar is full' do
        tiny_airport = Airport.new(1,weather)
        tiny_airport.land(plane)
        message = 'Hangar full! Do not land!'
        expect{tiny_airport.land(plane_1)}.to raise_error message
      end

    end

    context 'if the weather is stormy' do

      it 'raises an error and prevents landing' do
        allow(weather).to receive(:stormy?).and_return true
        message = 'Stormy weather! Do not land!'
        expect{airport.land(plane)}.to raise_error message
      end

    end

  end

  describe '#take_off' do

    before(:each) do
      airport.land(plane)
    end

    context 'if the weather is not stormy' do

      it 'instructs the plane to take off' do
        airport.take_off(plane)
        expect(plane).to have_received(:take_off)
      end

      it 'ensure the plane is no longer in the hangar' do
        airport.take_off(plane)
        expect(airport.hangar).not_to include plane
      end

      it 'cannot ask a plane that is not in the airport to take off' do
        message = 'Plane not in the hangar!'
        expect{airport.take_off(plane_1)}.to raise_error message
      end

    end

    context 'if the weather is stormy' do

      it 'raises an error to tell operator it is stormy' do
        allow(weather).to receive(:stormy?).and_return true
        message = 'Stomy weather! Do not take off!'
        expect{airport.take_off(plane)}.to raise_error message
      end

    end

  end

end