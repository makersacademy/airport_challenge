require 'airport'
require 'plane'

describe Airport do
  describe 'inspect docked planes' do
    airport = Airport.new
    it 'displays only the planes currently at the airport' do
      expect(airport.show_planes).to eq([])
      plane = Plane.new
      plane.land(airport)
      expect(airport.show_planes).to eq([plane])
      plane.take_off
      expect(airport.show_planes).to eq([])
    end
  end
end
