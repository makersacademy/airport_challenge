require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  
  it { is_expected.to respond_to(:land).with(1).argument }    
  
  describe '# landing' do
      
    it 'has a Default capcity' do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it '--to be prevented when airport is full' do 
      allow(airport).to receive(:stormy?).and_return false  
      Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'Airport is full no landing allowed'
    end

    it 'is prevented due to stormy weather' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land plane }.to raise_error "Due to stormy weather no landing allowed" 
    end
  end
  
  describe '#take-offs' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    
    it 'is prevented due to stormy weather' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.takeoff plane }.to raise_error "Due to stormy weather no landing allowed" 
    end
  end    
end
