require 'airport'
require 'plane'

describe Airport do

  describe '#plane_land' do

    it 'plane land at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.plane_land(plane)).to include(plane)
    end

  end

  describe 'plane_take_off' do

    it 'plane take off from an airport' do
      airport = Airport.new
      airport.plane_land(Plane.new)
      expect(airport.plane_take_off).to be_an_instance_of(Plane)
    end

  end
end
