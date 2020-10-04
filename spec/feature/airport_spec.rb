require 'airport'
require 'plane'

RSpec.describe Airport do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  describe '#land' do
    it 'Instruct a plane to land' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end
end
