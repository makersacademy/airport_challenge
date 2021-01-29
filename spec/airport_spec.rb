require 'airport'

describe Airport do
  describe '#land' do
    it 'informs air traffic controller plane has landed' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq "#{plane.id} successfully landed at #{airport.name}"
    end
  end
end