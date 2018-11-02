require 'airport'
require 'plane'

describe Airport do
  describe 'inspect docked planes' do
    it 'displays only the planes currently at the airport' do
      airport = Airport.new
      expect(airport.show_planes).to eq([])
      plane = instance_double('Plane')
      allow(plane).to receive(:land) {airport.accept(plane)}
      allow(plane).to receive(:take_off) {airport.release(plane)}
      plane.land(airport)
      expect(airport.show_planes).to eq([plane])
      plane.take_off
      expect(airport.show_planes).to eq([])
    end
  end
end
