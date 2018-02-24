require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#instruct_landing' do
    context "when weather not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      it 'instructs a plane to land' do
        expect(airport).to respond_to(:instruct_landing).with(1).argument
      end

    context 'when full ' do
      it 'does not allow planes to land' do
        20.times { airport.instruct_landing(plane) }
        expect { airport.instruct_landing(plane) }.to raise_error 'Cannot land. Airport is full'
      end
    end
  end

    context "when weather stormy" do
      it 'does not allow plane to land' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.instruct_landing(plane) }.to raise_error 'Cannot land due to stormy weather'
      end
    end
  end

  describe '#instruct_take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:instruct_take_off).with(1).argument
    end
  end
end
