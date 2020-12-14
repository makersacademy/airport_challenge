require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

describe Airport do
  describe '#land' do
    it 'allows a plane to land in its gate' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.gate).to include(plane)
    end
  end
  
  describe '#take_off' do
    it 'removes plain from hangar after take-off' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.gate).not_to include plane
    end
  end
end