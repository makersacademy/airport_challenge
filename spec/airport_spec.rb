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
    end
  end

  context 'Takeoff' do
    describe '#taking off' do
      it 'lets a plane takeoff from the airport' do
        plane = Plane.new
        airport.takeoff(plane)
        expect(plane.landed).to be false
      end

      it 'removes plane after takeoff' do
        plane = Plane.new
        airport.takeoff(plane)
        expect(airport.planes).not_to include plane
      end
    end
  end
end
