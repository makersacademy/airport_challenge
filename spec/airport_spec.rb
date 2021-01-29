require 'airport' 
require 'plane'

describe Airport do
  describe '#land' do
  
    it 'informs air traffic controller plane has landed' do
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      expect(airport.land(plane)).to eq "MAK942 successfully landed at Makers airport"
    end

    it 'lets a plane land at an airport and the controller can see that it has landed' do
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      airport.land(plane)
      expect(airport.planes).to eq ['MAK942']
    end

  end
end
