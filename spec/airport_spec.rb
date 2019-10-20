require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe 'landing a plane' do
    context 'when weather is sunny' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'has plane after landing' do
        airport.land plane
        expect(airport.planes).to include plane
      end

      # it 'planes that are landed cannot land again' do
      #   airport.land plane
      #   message = "Plane already landed"
      #   expect { airport.land(plane) }.to raise_error message
      # end

      it 'cannot land if at full capacity' do
        airport.capacity.times { airport.land(plane) }
        message = "Cannot land as airport full"
        expect { airport.land(plane) }.to raise_error message
      end
    end

    context 'when weather is stormy' do
      it 'prevents landing' do
        allow(airport).to receive(:stormy?).and_return true
        message = "Cannot land due to stormy weather"
        expect { airport.land(plane) }.to raise_error message
      end
    end
  end

  describe 'plane taking off' do
    context 'when weather is sunny' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      # it 'does not have plane' do
      # subject.land plane
      # airport.take_off plane
      # expect(airport.planes.include?(plane)).to eq false
      # end

      it 'confirms that plane is no longer in airport' do
        # subject.land plane
        message = "#{plane} no longer in airport\n"
        expect { airport.take_off(plane) }.to output(message).to_stdout
      end

      # it 'plane only takes off if it is in airport' do
      #    message = "Plane not in airport"
      #    expect { subject.take_off(plane) }.to raise_error message
      #  end
    end

    context 'when weather is stormy' do
      it 'prevents takeoff' do
        # subject.land(plane)
        allow(airport).to receive(:stormy?).and_return true
        message = "Cannot take off due to stormy weather"
        expect { airport.take_off(plane) }.to raise_error message
      end
    end
  end
end
