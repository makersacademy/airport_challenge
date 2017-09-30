require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }

  describe '#landing' do
    it 'lands a plane at the airport' do
      plane = Plane.new
      airport.land(plane)
      expect(plane.landed).to be true
    end
  end

  describe 'planes taking off' do
    it 'lets a plane takeoff from the airport' do
      plane = Plane.new
      airport.takeoff(plane)
      expect(plane.landed).to be false
    end
  end

end
