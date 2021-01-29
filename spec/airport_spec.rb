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

  describe '#take_off' do
    it 'informs air traffic controller that plane has taken off' do
      plane = Plane.new('MAK121')
      airport = Airport.new('Ruby airport')
      airport.land(plane)
      expect(airport.take_off(plane)).to eq 'MAK121 successfully taken off from Ruby airport'
    end
  end
end
