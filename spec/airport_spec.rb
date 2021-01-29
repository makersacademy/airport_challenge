require 'airport' 
require 'plane'

describe Airport do
  describe '#land' do
    it 'informs air traffic controller plane has landed' do
      plane = Plane.new('MAK942')
      airport = Airport.new('Makers airport')
      expect(airport.land(plane.flight_id)).to eq "#{plane.flight_id} successfully landed at #{airport.name}"
    end
  end
end
