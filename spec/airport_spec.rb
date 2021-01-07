require 'simplecov'
require 'airport'

describe Airport do  
  
  describe '#land' do
    context 'when weather is not stormy' do
      capacity = Airport::DEFAULT_CAPACITY
      airport = Airport.new(capacity)
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      it 'lands a plane' do
        plane = Plane.new
  
        actual_result = airport.land(plane)
        expected_result = [plane]
  
        expect(actual_result).to eq expected_result
      end
      
      context 'when airport is full' do
        it 'does not allow planes to land at capacity of 1 plane' do
          airport = Airport.new(1)
          plane = Plane.new
          
          allow(airport).to receive(:stormy?).and_return false
          airport.land(plane)
          
          expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
        end
        
        it 'does not allow planes to land at capacity of 2 planes' do
          airport = Airport.new(2)
          plane = Plane.new
          
          allow(airport).to receive(:stormy?).and_return false
          airport.land(plane)
          airport.land(plane)
          
          expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
        end
        it 'does not allow planes to land at DEFAULT capacity of 20 planes' do
          capacity = Airport::DEFAULT_CAPACITY
          airport = Airport.new(capacity)
          plane = Plane.new
          
          Airport::DEFAULT_CAPACITY.times do
            allow(airport).to receive(:stormy?).and_return false
            airport.land(plane)
          end
          
          expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
        end
      end
    end

    context 'when weather is stormy' do
      it 'raises an error if a plane tries to land' do
        capacity = Airport::DEFAULT_CAPACITY
        airport = Airport.new(capacity)
        plane = Plane.new
  
        allow(airport).to receive(:stormy?).and_return true
  
        expect { airport.land(plane) }.to raise_error 'Cannot take off: Weather stormy'

      end
    end
  end
  
  # The one-liner below is not necessary for the purposes of our methods, since we want out methods do something
  #it { is_expected.to respond_to(:take_off).with(1).argument }
  
  describe '#take_off' do
    context 'when not stormy' do
      it 'allows a plane to take off from the airport' do
        airport = Airport.new(1)
        plane = Plane.new
  
        allow(airport).to receive(:stormy?).and_return false
        landed_plane = airport.land(plane)
        actual_result = airport.take_off(landed_plane)
        expected_result = plane
  
        expect(actual_result).to eq expected_result
      end  
    end
    
    context 'when weather is stormy' do
      it 'raises an error if tries to take off' do
        airport = Airport.new
        plane = Plane.new
    
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off: Weather stormy'
      end
    end
  end
end