require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new(20, weather) }
  subject(:other_airport) { described_class.new(20, weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }


  describe '#instruct_landing' do
    context 'when weather not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to land' do
        expect(airport).to respond_to(:instruct_landing).with(1).argument
      end

      context 'when full' do
        it 'does not allow plane to land' do
          20.times { airport.instruct_landing(plane) }
          expect { airport.instruct_landing(plane) }.to raise_error 'Cannot land. Airport is full'
        end
      end
    end

    context 'when weather stormy' do
      it 'does not allow plane to land' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.instruct_landing(plane) }.to raise_error 'Cannot land due to stormy weather'
      end
    end
  end

  describe '#instruct_take_off' do
    context 'when weather not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:instruct_take_off).with(1).argument
      end

      it 'raises error if plane is not at this specific airport' do
        other_airport.instruct_landing(plane)
        expect { airport.instruct_take_off(plane) }.to raise_error 'Plane cannot take off. Plane at another airport'
      end
    end

    context 'when weather stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'instructs a plane not to take off' do
        expect { airport.instruct_take_off(plane) }.to raise_error 'Cannot take off due to stormy weather'
      end
    end
  end
end
