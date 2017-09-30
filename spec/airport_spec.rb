require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  context 'Landing' do
    describe '#landing' do
      it 'lands a plane at the airport' do
        plane = Plane.new
        airport.land(plane)
        expect(plane.landed).to be true
      end

      it 'contains the plane once landed' do
        plane = Plane.new
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'raises error if landing when airport is full' do
        plane = Plane.new
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error 'Airport full!'
      end
    end
  end

  context 'Takeoff' do
    describe '#taking off' do
      it 'lets a plane takeoff from the airport' do
        plane = Plane.new
        airport.land(plane)
        airport.takeoff(plane)
        expect(plane.landed).to be false
      end

      it 'removes plane after takeoff' do
        plane = Plane.new
        airport.land(plane)
        airport.takeoff(plane)
        expect(airport.planes).not_to include plane
      end

      it 'raises error if taking off when empty' do
        plane = Plane.new
        expect { airport.takeoff(plane) }.to raise_error 'Airport empty!'
      end
    end
  end
end
