require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new   }
  let(:plane)   {Plane.new}#{ double(:plane)}

    it 'should instruct a plane to land and confirm it has landed' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.planes.count).to eq 0
      airport.land(plane)
      expect(airport.planes.count).to eq 1

    end

    it 'should instruct a plane to take off ' do
      allow(airport).to receive(:stormy?).and_return(false)
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

    it 'should prevent land plane if the airport is full' do
      airport.capacity.times { airport.land(plane) }
      expect{airport.land(plane)}.to raise_error 'airport is full'
    end

end
