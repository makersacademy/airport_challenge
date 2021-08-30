require 'airport'

describe Airport do 
  subject (:airport) { described_class.new(10) }
  let(:airplane) { double :plane }
  
  describe '#land' do
    it 'tells airplane to land' do
      expect(airport).to respond_to(:land).with(1).argument 
    end
  end

  context 'when at capacity' do
    it 'raises an error' do
      10.times do 
        airport.land(airplane)
      end   
      expect { airport.land(airplane) }.to raise_error 'Airport full: Cannot land'
    end
  end  

  describe '#take_off' do 
    it 'tells airplane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end  
end
