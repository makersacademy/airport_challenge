require 'simplecov'
SimpleCov.start

require 'airport'
require 'weather'
describe Airport do  

  describe '#land' do
    context 'when weather is not stormy' do
      it 'lands a plane' do
        capacity = Airport::DEFAULT_CAPACITY
        weather = Weather.new
        airport = Airport.new(capacity, weather)
        plane = Plane.new

        allow(weather).to receive(:stormy?).and_return false
        actual_result = airport.land(plane)
        expected_result = [plane]
  
        expect(actual_result).to eq expected_result
      end
      
      context 'when airport is full' do
        it 'does not allow planes to land at capacity of 1 plane' do
          airport = Airport.new(1, weather = Weather.new)
          plane = Plane.new
          
          allow(weather).to receive(:stormy?).and_return false
          airport.land(plane)
          
          expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
        end
        
        it 'does not allow planes to land at capacity of 2 planes' do
          airport = Airport.new(2, weather = Weather.new)
          plane = Plane.new
          
          allow(weather).to receive(:stormy?).and_return false
          airport.land(plane)
          allow(weather).to receive(:stormy?).and_return false
          airport.land(plane)
          
          expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
        end
        it 'does not allow planes to land at DEFAULT capacity of 20 planes' do
          capacity = Airport::DEFAULT_CAPACITY
          airport = Airport.new(capacity, weather = Weather.new)
          plane = Plane.new
          
          Airport::DEFAULT_CAPACITY.times do
            allow(weather).to receive(:stormy?).and_return false
            airport.land(plane)
          end
          
          expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
        end
      end
    end

    context 'when weather is stormy' do
      it 'raises an error if a plane tries to land' do
        capacity = Airport::DEFAULT_CAPACITY
        airport = Airport.new(capacity, weather = Weather.new)
        plane = Plane.new
        allow(weather).to receive(:rand_stormy).and_return :stormy
        allow(weather).to receive(:stormy?).and_return true
  
        expect { airport.land(plane) }.to raise_error 'Cannot land: Weather stormy'

      end
    end
  end
  
  describe '#take_off' do
    context 'when not stormy' do
      it 'allows a plane to take off from the airport' do
        airport = Airport.new(1, weather = Weather.new)
        plane = Plane.new
  
        allow(weather).to receive(:stormy?).and_return false
        airport.land(plane)
        actual_result = airport.take_off
        expected_result = plane
  
        expect(actual_result).to eq expected_result
      end  
    end
    
    context 'when weather is stormy' do
      it 'raises an error if tries to take off' do
        airport = Airport.new(1, weather = Weather.new)
        plane = Plane.new
    
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.take_off }.to raise_error 'Cannot take off: Weather stormy'
      end
    end
  end
end
