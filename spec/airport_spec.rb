require 'airport'

describe Airport do
  describe '#land' do
     it 'checks .land instructs a plane to land at airport' do
        airport = Airport.new 
        plane = Plane.new
        expect { airport.land(plane) }.not_to raise_error
     end
  end

end
