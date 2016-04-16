require 'airport'

describe Airport do
  subject {described_class.new}

  let(:airport) { subject }
  let(:plane) { spy(:plane) }
  let(:plane1) { spy(:plane) }

  describe '#land' do

    context 'if the weather is not stormy' do

      it 'instructs the plane to land if hangar is not full' do
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        expect(plane).to have_received(:land)
      end

      it 'confirms the plane has landed' do
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        expect(airport.hangar).to include plane
      end

      it 'raise an error if the hangar is full' do
        tiny_airport = Airport.new(1)
        allow(tiny_airport).to receive(:stormy?).and_return false
        tiny_airport.land(plane)
        expect{tiny_airport.land(plane1)}.to raise_error 'Hangar full! Do not land!'
      end

    end

    context 'if the weather is stormy' do

      it 'raises an error and prevents landing' do
        allow(airport).to receive(:stormy?).and_return true
        expect{airport.land(plane)}.to raise_error 'Stormy weather! Do not land!'
      end

    end

  end

  describe '#take_off' do

    context 'if the weather is not stormy' do

      it 'instructs the plane to take off' do
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        allow(airport).to receive(:stormy?).and_return false
        airport.take_off(plane)
        expect(plane).to have_received(:take_off)
      end

    end

    context 'if the weather is stormy' do

      it 'raises an error to tell operator it is stormy' do
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        allow(airport).to receive(:stormy?).and_return true
        expect{airport.take_off(plane)}.to raise_error 'Stomy weather! Do not take off!'
      end

    end

  end

end