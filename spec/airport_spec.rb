require 'airport'

describe Airport do

  let(:airport) { subject }
  let(:plane) { spy(:plane) }
  let(:plane1) { spy(:plane) }
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
        expect{tiny_airport.land(plane1)}.to raise_error
        'Hangar full! Do not land!'
      end

    end

    context 'if the weather is stormy' do

      it 'raises an error and prevents landing' do
        allow(weather).to receive(:stormy?).and_return true
        expect{airport.land(plane)}.to raise_error
        'Stormy weather! Do not land!'
      end

    end

  end

  describe '#take_off' do

    context 'if the weather is not stormy' do

      it 'instructs the plane to take off' do
        airport.land(plane)
        airport.take_off(plane)
        expect(plane).to have_received(:take_off)
      end

      it 'ensure the plane is no longer in the hangar' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.hangar).not_to include plane
      end

    end

    context 'if the weather is stormy' do

      it 'raises an error to tell operator it is stormy' do
        airport.land(plane)
        allow(weather).to receive(:stormy?).and_return true
        expect{airport.take_off(plane)}.to raise_error
        'Stomy weather! Do not take off!'
      end

    end

  end

end