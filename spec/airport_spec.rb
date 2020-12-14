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
    it 'prevent landing if gate is full' do
        #assume capacity to be 1
        airport = Airport.new
        plane = Plane.new
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error('cannot land, airport is full')
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
=begin
    it 'does not land if weather is stormy' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error('stormy weather, cannot take off')
    end
=end
  end
end