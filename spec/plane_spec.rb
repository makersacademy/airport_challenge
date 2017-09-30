require 'plane'

class FakeAirport

end

describe Plane do
  subject(:plane) { Plane.new }
  describe "#land" do
    it 'lands a plane at an airport' do
      expect(plane.land(FakeAirport.new)).to be true
    end
  end

  describe "#takeoff" do
    it 'tells a plane to takeoff from an airport' do
      expect(plane.takeoff).to be true
    end

  end

end
