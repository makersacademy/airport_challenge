require 'airport'
describe Airport do
  subject(:airport) { described_class.new } 
  let(:plane) { double :plane }
  let(:airport) { Airport.new(2) }
  let(:plane) { Plane.new }
   
  describe '#land' do

    context 'when not stormy' do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'responds to land' do
        expect(airport).to respond_to(:land).with(1).argument 
      end

      it 'lands a plane' do 
        expect(airport.land(plane)).to eq([plane])
      end

      context 'when full' do

        it 'raises an error' do
          2.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error('Airport full:take off a plane to land this one') 
        end
      end
    end

    context 'when storm' do

      it 'doesnt allow landings ' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error('cant land, is stormy')
      end
    end
  end
  
  describe '#take off' do

    context 'when not stormy' do

      before do 
        allow(airport).to receive(:stormy?).and_return false
      end
    
      it 'responds to take of' do
        expect(airport).to respond_to(:take_off).with(1).argument 
      end
      it 'takes-of a plane' do 
        @planes = []
        airport.land(plane)
        @planes << plane
        airport.take_off(plane)
        @planes.delete(plane)
        expect(@planes).not_to include(plane)
      end

      it 'confirms that plane is no longer at the airport' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane  
      end
    end

    context 'when stormy' do

      it 'doesnt allow take offs ' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error('cant take off, is stormy')
      end
    end
  end
end   
