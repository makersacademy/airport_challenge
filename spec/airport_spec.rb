require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }
   
  
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

    it 'raise an error when plane is not in the air before landing' do
      allow(airport).to receive(:stormy?).and_return false
      plane = Plane.new(true)
      expect { airport.land plane }.to raise_error "Plane is not in the air"
    end
    it 'lands multiple planes' do # bonus points
      allow(airport).to receive(:stormy?).and_return false  
      5.times { airport.land Plane.new } 
      expect { airport.land Plane.new }.not_to raise_error 
    end
  end
  
  describe '#take-offs' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
    
    it 'informs that the plane has taken off' do
      allow(airport).to receive(:stormy?).and_return false
      airport.planes << plane
      expect(airport.takeoff plane).to eq 'plane has taken off'  
    end
    it 'gets weather status' do
      allow(airport).to receive(:stormy?).and_return false
      expect(weather.stormy).to be(true).or be(false)
    end  
    it 'is prevented due to stormy weather' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.takeoff plane }.to raise_error "Due to stormy weather no landing allowed" 
    end
    
    it 'raise an error when plane is not in the airport before taking off' do
      allow(airport).to receive(:stormy?).and_return false
      plane.in_flight = true
      expect { airport.takeoff plane }.to raise_error "Plane is not at the airport"
    end
    it 'multiple planes' do # bonus points
      allow(airport).to receive(:stormy?).and_return false  
      5.times { airport.land Plane.new } 
      expect { airport.takeoff plane }.not_to raise_error 
    end
  end    
end
