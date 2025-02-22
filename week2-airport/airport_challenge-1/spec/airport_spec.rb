require 'airport'

describe Airport do 
  subject (:airport) { described_class.new(10) }
  let(:airplane) { double :airplane }
  
  describe '#land' do
    
  context 'when at capacity' do
    it 'raises an error' do
      10.times do 
        airport.land(airplane)
      end   
      expect { airport.land(airplane) }.to raise_error 'Cannot land: Airport at capacity'
    end
  end  
    
  context 'when sunny' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    it 'tells airplane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end    
    
  context 'when stormy' do
    it 'raises an error when asked to land a plane' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(airplane) }.to raise_error 'Cannot land: weather is stormy'
    end
  end
 

    describe '#take_off' do 
      context 'when not stormy' do
        before do
          allow(airport).to receive(:stormy?).and_return false
        end
        it 'tells airplane to take off' do
          expect(airport).to respond_to(:take_off).with(1).argument
        end
      context 'when stormy' do
        before do
          allow(airport).to receive(:stormy?).and_return true
        end
          it 'raises an error when airplane tries to take off' do
            expect { airport.take_off(airplane) }.to raise_error 'Cannot take off: weather is stormy'
          end
        end
      end  
    end 
  end
end
