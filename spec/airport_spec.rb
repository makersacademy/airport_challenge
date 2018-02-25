require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'

describe Airport do

  describe '#create_plane' do
    it 'creates a plane object' do
      airport = Airport.new
      expect(airport.create_plane).to be_an_instance_of(Plane)
    end
  end

  describe '#plane_lands' do
    it 'accepts plane into airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.plane_lands(plane)).to include(plane)
    end
  end

  describe '#plane_takeoff' do
    it 'pops plane from airport' do
      airport = Airport.new
      expect(airport).to respond_to :plane_takeoff
    end
  end

end
