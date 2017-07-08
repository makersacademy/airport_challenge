require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new(0)  }
  let(:plane)   { Plane.new   }

    it 'should instruct a plane to land, store in airport, and confirm plane status is: In Airport' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.planes.count).to eq 0
      airport.land(plane)
      expect(plane.status).to eq "In Airport"
      expect(airport.planes.count).to eq 1
    end

    it 'should raise error and prevent plane landing if stormy weather' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.land(plane)}.to raise_error "Landing prevented due to stormy weather"
    end

    it 'should instruct a plane to take off, release from airport, and confirm plane status is: Flying' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.planes.count).to eq 0
      airport.land(plane)
      expect(airport.planes.count).to eq 1
      airport.take_off(plane)
      expect(airport.planes.count).to eq 0
      expect(plane.status).to eq "Flying"
    end

    it 'should raise error and prevent a plane taking off if stormy weather' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.take_off(plane)}.to raise_error "Take off prevented due to stormy weather"
    end

    it 'should have a default capacity that can be overridden' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
      airport.capacity = 25
      expect(airport.capacity).to eq 25
    end

    it 'should prevent land plane if the airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.capacity.times { airport.land(plane) }
      expect{airport.land(plane)}.to raise_error 'Airport is full'
    end

end
