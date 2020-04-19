require 'airport'
require 'plane'

describe Airport do

  describe 'plane_count' do
    before(:all) do
     @plane = Plane.new
     @airport = Airport.new
    end

    it 'increments by one when a plane lands'do
      @plane.land(@airport)
      expect(@airport.plane_count).to eq(1)
    end

    it 'decrements by one when a plane lands' do
      @plane.takeoff(@airport)
      expect(@airport.plane_count).to eq(0)
    end
  end
end
