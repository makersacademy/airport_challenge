require 'airport'

describe 'Feature testing' do
  context 'Plane can land in airport' do
    it 'A plane can be created and land in an airport' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) {false}
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
  end
end
