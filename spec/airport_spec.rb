require 'airport'

describe Airport do
  let (:airport) { Airport.new(20) }
  let (:plane) { Plane.new }
  
  describe '#land' do

    it 'checks .land instructs a plane to land at airport' do
        allow(airport).to receive(:stormy?).and_return false
        expect airport.land(plane) 
        expect(airport.hangar).to include (plane)
    end

    it 'checks .land prevents landing when airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Cannot land, airport full"
    end
    
    it 'checks .land prevents landing when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Cannot land, weather is stormy'
    end
  end

  describe '#take_off' do
    it 'checks .take_off instructs a plane to take off from an airport' do
      expect airport.take_off(plane) 
    end

    it 'checks .take_off prevents take off when stormy' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off, weather is stormy'
      end
  end
  
  describe '#hangar' do
  end
end
