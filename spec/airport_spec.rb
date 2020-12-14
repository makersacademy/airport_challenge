require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'instruct a plane to land at airport hangar' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.hangar).to include plane
    end

    it 'raise an error when airport hangar is full' do
      airport = Airport.new
      plane = Plane.new
      airport.capacity.times { airport.land(plane) }
      expect {airport.land(plane)}.to raise_error 'Airport hangar is full'
    end
  end

  describe '#take_off' do
    it 'instruct a plane to takeoff and confirm it is no longer in the airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hangar).not_to include [plane]
    end
  end

  describe '#capacity' do
    it 'override airport hangar capacity' do
      airport = Airport.new(30)
      plane = Plane.new
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Airport hangar is full'
    end
  end
end