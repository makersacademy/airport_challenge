require 'airport'

describe Airport do
  let(:airport) { Airport.new   }
  let(:plane)   { double(:plane)}

    it 'should store a plane' do
      expect(airport.planes.count).to eq 0
      airport.land(plane)
      expect(airport.planes.count).to eq 1
    end

    it 'should instruct a plane to take off ' do
      expect(airport.planes.count).to eq 0
      airport.land(plane)
      expect(airport.planes.count).to eq 1
      airport.take_off(plane)
      expect(airport.planes.count).to eq 0
    end

    it 'should have a default capacity that can be overridden' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
      airport.capacity = 25
      expect(airport.capacity).to eq 25
    end

    it 'should report true if the airport is full' do
      expect(airport.full?).to eq false
      airport.capacity.times { airport.land(plane) }
      expect(airport.full?).to eq true
    end

end
