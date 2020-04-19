require 'plane'
require 'airport'

describe Plane do

  describe 'land and takeoff' do
    before(:each) do
      @plane = Plane.new
      @airport = Airport.new
    end

    describe 'land' do
      it 'Can land in a airport' do
        expect(@plane.land(@airport)).to eq("Landed in #{@airport}")
      end
    end

  describe 'takeoff' do
    it 'Can takeoff from a airport' do
      expect(@plane.takeoff(@airport)).to eq("Departed from #{@airport}")
      end
    end
  end
end
