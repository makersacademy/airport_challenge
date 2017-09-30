require 'plane'

class FakeAirport
  attr_reader :parked_plane

  def parked_plane

  end
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
      airport = FakeAirport.new
      expect(plane.takeoff).to be true
      expect(airport.parked_plane).to be_nil
    end

  end

end
