require 'airport'

describe Airport do
  subject(:airport) { described_class.new(30) }
  let(:plane) { double :plane }

  describe 'land 🛬' do
    it 'instructs a plane to land' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when full' do
      it 'will raise an error' do
        allow(airport).to receive(:stormy?).and_return false
        30.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Unable to land plane: no empty spaces.'
    end
  end

    it 'will raise an error when attempting to land in a storm' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Unable to land plane: stormy weather.'
    end
end

  describe 'take_off 🛫' do
    it 'instructs a plane to take off and confirm that it is no longer in the airport' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end