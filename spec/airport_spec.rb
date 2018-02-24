require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#instruct_landing' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:instruct_landing).with(1).argument
    end

    context 'when full' do
      it 'does not allow planes to land' do
        20.times { airport.instruct_landing(plane) }
        expect { airport.instruct_landing(plane) }.to raise_error 'Cannot land. Airport is full'
      end
    end

  end

  describe '#instruct_take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:instruct_take_off).with(1).argument
    end
  end

end
