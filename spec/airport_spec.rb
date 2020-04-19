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
      @plane.takeoff
      expect(@airport.plane_count).to eq(0)
    end
  end

  describe 'capacity' do
    before(:all) do
     @airport = Airport.new
    end

    it { is_expected.to respond_to :capacity}
    end
  end
