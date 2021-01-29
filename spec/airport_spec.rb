require 'airport'

describe Airport do
  describe '#land' do
     it 'checks .land instructs a plane to land at airport' do
        airport = Airport.new 
        plane = Plane.new
        expect { airport.land(plane) }.not_to raise_error
     end
  end

  describe '#take_off' do
    it 'checks .take_off instructs a plane to take off from an airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end
  end

end
