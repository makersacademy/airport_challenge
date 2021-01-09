require 'airport'

describe Airport do

  subject(:airport) { Airport.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    context 'when not stormy' do
      before do 
        allow(airport).to receive(:stormy?).and_return false
      end
      it 'instruct the plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'is full' do
        it 'raises error' do
          20.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
        end
      end
    end

   context 'when stormy' do
      it 'raises error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane - stormy weather"
      end
    end
  end
  
  describe '#take_off' do
    it 'instruct the plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end